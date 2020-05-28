print("\n.pdbrc.py started")

# # Find home.
# import os
# home = os.curdir
# if 'HOME' in os.environ:
#     home = os.environ['HOME']
# elif os.name == 'posix':
#     home = os.path.expanduser("~/")
# # Make sure home always ends with a directory separator.
# home = os.path.realpath(home) + os.sep
# print("Home folder: " + home)

# # Command line history.
# # Source: https://wiki.python.org/moin/PdbRcIdea
# import readline
# histfile = home + ".pdb_history"
# print("Command history: " + histfile)
# try:
#     readline.read_history_file(histfile)
# except IOError:
#     pass
# import atexit
# atexit.register(readline.write_history_file, histfile)
# del histfile
# readline.set_history_length(20000)

# import pdb

# class Config(pdb.DefaultConfig):
#     sticky_by_default = True # start in sticky mode
#     current_line_color = 40  # black
# """
# This is an example configuration file for pdb++.
# Actually, it is what the author uses daily :-). Put it into ~/.pdbrc.py to use
# it.
# """

import pdb
# import readline


class Config(pdb.DefaultConfig):
    sticky_by_default = True # start in sticky mode
    current_line_color = 40  # black

    editor = 'e'
    stdin_paste = 'epaste'
    # filename_color = pdb.Color.lightgray
    use_terminal256formatter = False
    #exec_if_unfocused = "play ~/sounds/dialtone.wav 2> /dev/null &"

    def __init__(self):
        # readline.parse_and_bind('set convert-meta on')
        # readline.parse_and_bind('Meta-/: complete')

        try:
            from pygments.formatters import terminal
        except ImportError:
            pass
        else:
            self.colorscheme = terminal.TERMINAL_COLORS.copy()
            self.colorscheme.update({
                terminal.Keyword:            ('darkred',     'red'),
                terminal.Number:             ('darkyellow',  'yellow'),
                terminal.String:             ('brown',       'green'),
                terminal.Name.Function:      ('darkgreen',   'blue'),
                terminal.Name.Namespace:     ('teal',        'turquoise'),
                })

    def setup(self, pdb):
        # make 'l' an alias to 'longlist'
        Pdb = pdb.__class__
        Pdb.do_l = Pdb.do_longlist
        Pdb.do_st = Pdb.do_sticky

print(".pdbrc.py finished")
