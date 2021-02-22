save_data_tree <- function(main.dir,
                           model.name,
                           data.type="inputs"){

  file.dir <- file.path(main.dir, model.name, data.type)
  files <- list.files(file.dir, full.names = FALSE, recursive = TRUE)

  split_path <- lapply(strsplit(files, "/"), function(z) as.data.frame(t(z)))
  path_table <- rbind.fill(split_path)

  if (data.type=="inputs") {
    path_table <- cbind(rep("Inputs", times=nrow(path_table)),
                        path_table)
  }

  if (data.type=="outputs") {
    path_table <- cbind(rep("Outputs", times=nrow(path_table)),
                        path_table)
  }

  path_table$pathString <- apply(path_table, 1, function(x) paste(trimws(na.omit(x)), collapse="/"))

  if (data.type=="inputs") {
    write.csv(path_table, file = file.path(dirname(file.dir), "inputs.csv"))
  }
  if (data.type=="outputs") {
    write.csv(path_table, file = file.path(dirname(file.dir), "outputs.csv"))
  }
}

main.dir <- file.path(getwd(), "docs")


# Ecology and fishery simulator ---------------------------------------------------------------

# Atlantis inputs tree
save_data_tree(main.dir = main.dir,
               model.name = "Atlantis",
               data.type = "inputs")

# Atlantis outputs tree
save_data_tree(main.dir = main.dir,
               model.name = "Atlantis",
               data.type = "outputs")

# Atlantis inputs tree
save_data_tree(main.dir = main.dir,
               model.name = "Atlantis",
               data.type = "inputs")

# Stock assessment operating tools ------------------------------------------------------------

# Atlantisom inputs tree
save_data_tree(main.dir = main.dir,
               model.name = "Atlantisom",
               data.type = "inputs")

# Atlantisom inputs tree
save_data_tree(main.dir = main.dir,
               model.name = "Atlantisom",
               data.type = "outputs")


# Stock assessment models ---------------------------------------------------------------------

# Gadget inputs tree
save_data_tree(main.dir = main.dir,
               model.name = "Gadget",
               data.type = "inputs")
# Gadget inputs tree
save_data_tree(main.dir = main.dir,
               model.name = "Gadget",
               data.type = "outputs")

