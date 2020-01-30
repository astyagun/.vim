command! CleanupTaskPaper %s/ @\(autodone(false)\|\(context\|tags\)([^)]\+)\)//g
