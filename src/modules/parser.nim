import os
import strutils
import parsecfg

proc parser(file="cakefile", tasks: seq[string]) =
  
  var dict: Config

  try:
    dict = loadConfig(file)
  except Exception:
    echo "file "&file&" doesn't exist"
    quit(1)
  
  let cakeTasks = dict.getSectionValue("Cake", "Tasks").split(" ")
  
  if tasks.len == 0:
    echo "Please enter a task"
    echo "Available tasks: "&cakeTasks.join(",")

  for i in tasks:
    if i in cakeTasks:
      try:
        echo "Running task "&i
        if execShellCmd(dict.getSectionValue(i, "execCmd")) != 0:
          echo "Task "&i&" failed!"
          quit(1)
        else:
          echo "Task "&i&" ran successfully!"
      except:
        echo "Task listed in Tasks but doesn't actually exist!"
        quit(1)
    else:
      echo i&" is not a task"
      echo "Available tasks: "&cakeTasks.join(",")
      quit(1)
