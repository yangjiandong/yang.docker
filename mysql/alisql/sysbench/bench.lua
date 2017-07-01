#!/usr/bin/env sysbench

-- https://www.pythian.com/blog/sysbench-1-0-was-released/
 
function prepare()
  -- Not really needed and not used in this demonstration
  print("Preparing the benchmark.")
end
 
function event()
  -- Empty event
end
 
function cleanup()
  -- Not really needed and not used in this demonstration
  print("Cleaning up after the benchmark.")
end