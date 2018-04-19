function tagit(){
      mkdir -p $HOME/.tags
      ctags -f tags.cpp `find $1 -name "*.cpp" -o -name "*.h"`
      # ctags -f tags.pde --langmap=c++:.pde `find . -name "*.pde"`
      cat tags.cpp tags.pde > tags
      sort tags -o tags
      rm -f tags.*
}
