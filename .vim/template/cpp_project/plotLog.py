# // gather the points in c++
# printf("\n-----------\n");
# printf("title:flow factory of 0.50,xlabel:Step Count,ylabel:Pressure (Pa)\n");
# printf("legend:sectorA,sectorB,sectorC,sectorD,sectorE,sectorF\n");
# for (int i = 0; i < 2000; i++)
# {
#     operateModel(1);
#     printf("%d,%lf,%lf,%lf,%lf,%lf,%lf\n",
#            i,
#            uutArsPhysModel->cabinPhysics.sectorA.fluidVolume.totalPressure,
#            uutArsPhysModel->cabinPhysics.sectorB.fluidVolume.totalPressure,
#            uutArsPhysModel->cabinPhysics.sectorC.fluidVolume.totalPressure,
#            uutArsPhysModel->cabinPhysics.sectorD.fluidVolume.totalPressure,
#            uutArsPhysModel->cabinPhysics.sectorE.fluidVolume.totalPressure,
#            uutArsPhysModel->cabinPhysics.sectorF.fluidVolume.totalPressure);
# }
# printf("\n-----------\n");

import math
from collections import defaultdict
import matplotlib.pyplot as plt


def update_annot(ind):
    pos = sc.get_offsets()[ind["ind"][0]]
    annot.xy = pos
    text = "{}, {}".format(" ".join(list(map(str,ind["ind"]))), 
                           " ".join([names[n] for n in ind["ind"]]))
    annot.set_text(text)
    annot.get_bbox_patch().set_facecolor(cmap(norm(c[ind["ind"][0]])))
    annot.get_bbox_patch().set_alpha(0.4)


def hover(event):
    vis = annot.get_visible()
    if event.inaxes == ax:
        cont, ind = sc.contains(event)
        if cont:
            update_annot(ind)
            annot.set_visible(True)
            fig.canvas.draw_idle()
        else:
            if vis:
                annot.set_visible(False)
                fig.canvas.draw_idle()


class AnnoteFinder(object):
    """callback for matplotlib to display an annotation when points are
    clicked on.  The point which is closest to the click and within
    xtol and ytol is identified.
    
    Register this function like this:
    
    scatter(xdata, ydata)
    af = AnnoteFinder(xdata, ydata, annotes)
    connect('button_press_event', af)
    """

    def __init__(self, xdata, ydata, annotes, ax=None, xtol=None, ytol=None):
        self.data = list(zip(xdata, ydata, annotes))
        if xtol is None:
            xtol = ((max(xdata) - min(xdata))/float(len(xdata)))/2
        if ytol is None:
            ytol = ((max(ydata) - min(ydata))/float(len(ydata)))/2
        self.xtol = xtol
        self.ytol = ytol
        if ax is None:
            self.ax = plt.gca()
        else:
            self.ax = ax
        self.drawnAnnotations = {}
        self.links = []

    def distance(self, x1, x2, y1, y2):
        """
        return the distance between two points
        """
        return(math.sqrt((x1 - x2)**2 + (y1 - y2)**2))

    def __call__(self, event):

        if event.inaxes:
            clickX = event.xdata
            clickY = event.ydata
            if (self.ax is None) or (self.ax is event.inaxes):

                annotes = []
                # print(event.xdata, event.ydata)
                for x, y, a in self.data:
                    print("GOT HERE to annotes {} {} {}".format(x,y,a))
                    # print(x, y, a)
                    if ((clickX-self.xtol < x < clickX+self.xtol) and (clickY-self.ytol < y < clickY+self.ytol)):
                        annotes.append((self.distance(x, clickX, y, clickY), x, y, a))
                if annotes:
                    annotes.sort()
                    distance, x, y, annote = annotes[0]
                    self.drawAnnote(event.inaxes, x, y, annote)
                    for l in self.links:
                        l.drawSpecificAnnote(annote)

    def drawAnnote(self, ax, x, y, annote):
        """
        Draw the annotation on the plot
        """
        if (x, y) in self.drawnAnnotations:
            markers = self.drawnAnnotations[(x, y)]
            for m in markers:
                m.set_visible(not m.get_visible())
            self.ax.figure.canvas.draw_idle()
        else:
            t = ax.text(x, y, " - %s" % (annote),)
            m = ax.scatter([x], [y], marker='d', c='r', zorder=100)
            self.drawnAnnotations[(x, y)] = (t, m)
            self.ax.figure.canvas.draw_idle()

    def drawSpecificAnnote(self, annote):
        annotesToDraw = [(x, y, a) for x, y, a in self.data if a == annote]
        for x, y, a in annotesToDraw:
            self.drawAnnote(self.ax, x, y, a)

# cid = fig.canvas.mpl_connect('button_press_event', onclick)

# fig.canvas.mpl_connect("motion_notify_event", hover)


def onclick(event):
    print('%s click: button=%d, x=%d, y=%d, xdata=%f, ydata=%f' %
          ('double' if event.dblclick else 'single', event.button,
           event.x, event.y, event.xdata, event.ydata))

def linkAnnotationFinders(afs):
    for i in range(len(afs)):
        allButSelfAfs = afs[:i]+afs[i+1:]
        afs[i].links.extend(allButSelfAfs)

stringMarker = "----------"
foundIt = False
data = defaultdict(lambda: [])
labels = defaultdict(lambda: [])

ax_kwargs = defaultdict(lambda: dict())
# https://matplotlib.org/3.1.1/api/_as_gen/matplotlib.pyplot.axes.html


filepath = '/home/e367212/edev/OrionSim/SIMSW/sECLSS/sECLSS_ut.log'
with open(filepath) as fp:
    line = fp.readline()
    cnt = 1
    while line:
        if stringMarker in line:
             # toggle
             foundIt = not foundIt
        
        if foundIt:
             line_split = line.split("=")

             if len(line_split) > 2:
                 new_linesplit = []
                 new_linesplit.append(line_split[0])
                 new_linesplit.append("=".join(line_split[1:]))
                 line_split = new_linesplit

             if len(line_split)==2:
                 ax_n = line_split[0]
                 line_data = line_split[1]
             else:
                 ax_n = "default"
                 line_data = line

             try:
                 # print("{}".format(line_data.split(',')))
                 datum = [float(x) for x in line_data.strip().split(',')]
                 # print("line: {}".format(line_data))
                 # print("ax_n:{}, {}".format(ax_n,datum))
                 data[ax_n].append(datum)
             except ValueError as err:
                 # print("WARNING: {0}\nline_data: {1}".format(err, line_data))
                 if "legend" in line_data:
                     print("legend: {}".format(line_data))
                     split = line_data.split(":")
                     labels[ax_n] = split[1].split(",")
                     print("labels:{}".format(labels))
                 else:
                     infoline_data = line_data.strip().split(',')
                     for info in infoline_data:
                         print("info: {}".format(info))
                         split = info.split(":")
                         if len(split) == 2:
                             ax_kwargs[ax_n].update({split[0]: split[1]})

        line = fp.readline()
        cnt += 1

afs = []
for key, data_n in data.iteritems():
    transposed = zip(*data_n)
    # print(transposed)

    indep = transposed.pop(0)

    fig = plt.figure(key)

    ax = plt.axes(**ax_kwargs[key])

    for i in range(len(transposed)):

        decor_pairs = {}
        if labels[key] and "@" in labels[key][i]:
            name, decor_split = labels[key][i].split("@")
            # update the name here
            labels[key][i] = name
            decor_keyval = decor_split.split(";")
            for decor in decor_keyval:
                decor_split = decor.split("=")
                decor_pairs.update({decor_split[0]: decor_split[1].replace("\n",'')})
                
        marker = decor_pairs.pop("marker", None)
        # print("labels[{0}]: {1}".format(key, labels[key]))
        # print("marker value is {0}".format(marker))

        plot_array = [indep, transposed[i]]
        if marker:
            plot_array.append(marker.replace("'",''))

        # if decor_pairs:
            # for key,value in decor_pairs.iteritems():
            #     plot_array.append({key: value.replace("'",'')})
        # print("plot array is {0}".format(plot_array))

        if labels[key]:
            ax.plot(*plot_array, label=labels[key][i])
        else:
            ax.plot(*plot_array)


        # af = AnnoteFinder(indep, transposed[i], [str(item) for item in transposed[i]], ax=ax)
    
        # getting annotation
        # for i,j in zip(indep,transposed[i]):
            # annot = ax.annotate(str(j), xy=(i, j))
            # annot.set_visible(False)

    # if indepName:
        # ax.set_xlabel(indepName)
    if labels[key]:
        ax.legend()

    mng = plt.get_current_fig_manager()
    # mng.full_screen_toggle()

    # allow each figure to be clickable
    # cid = fig.canvas.mpl_connect('button_press_event', onclick)
    # cid = fig.canvas.mpl_connect('button_press_event', af)
    # afs.append(af)


linkAnnotationFinders(afs)


plt.show()

plt.raw_input()
