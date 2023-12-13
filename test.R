
gs <- system.file("extdata", package = "flowWorkspaceData") |>
  list.files(pattern = "gs_manual", full = TRUE) |>
  flowWorkspace::load_gs()
outFile <- tempfile(fileext = ".wsp")
system2("docker", args = "pull public.ecr.aws/x4k5d9i7/cytoverse/gs-to-wsp")
debugonce(CytoML::gatingset_to_flowjo)
CytoML::gatingset_to_flowjo(
  gs, outFile,
  docker_img = "public.ecr.aws/x4k5d9i7/cytoverse/gs-to-wsp"
)
