local status, neodev = pcall(require, "neodev")
if not status then
  print("neodev not found")
  return
end

neodev.setup()
