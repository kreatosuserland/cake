import os
import strutils
import parsecfg
import sequtils

var dict: Config

proc err(errString: string) =
  ## Errors out.
  echo errString
  quit(1)

proc runner(file: string, task: string) =
  ## Runs a task.
  if execShellCmd(dict.getSectionValue(task, "execCmd")) != 0:
    err "Task "&task&" failed!"
  else:
    echo "Task "&task&" ran successfully!"

proc parser(file="cakefile", tasks=toSeq(["make"])) =
  
  try:
    dict = loadConfig(file)
  except Exception:
    echo "file "&file&" doesn't exist"
    quit(1)
  
  let cakeTasks = dict.getSectionValue("Cake", "Tasks").split(" ")
  
  for i in tasks:
    if i in cakeTasks:
      try:
        echo "Running task "&i
        
        if dict.getSectionValue(i, "Depends") != "":
            echo "Running "&dict.getSectionValue(i, "Depends")&" as a dependency to "&i
            runner(file=file, task=dict.getSectionValue(i, "Depends"))
        
        runner(file=file, task=i)

      except:
        echo "Task listed in Tasks but doesn't actually exist!"
        quit(1)
    else:
      echo i&" is not a task"
      err "Available tasks: "&cakeTasks.join(",")
