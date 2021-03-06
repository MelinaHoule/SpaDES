#
#  SpaDES/R/SpaDES-package.R by Alex M Chubaty and Eliot J B McIntire
#  Copyright (C) 2016 Her Majesty the Queen in Right of Canada,
#   as represented by the Minister of Natural Resources Canada
#

#' Categorized overview of the \code{SpaDES} package
#'
#' @description
#'
#' This package allows implementation a variety of simulation-type models,
#' with a focus on spatially explicit models.
#' The core simulation components are built upon a discrete event simulation
#' framework that facilitates modularity, and easily enables the user to
#' include additional functionality by running user-built simulation modules.
#' Included are numerous tools to visualize various spatial data formats,
#' as well as non-spatial data.
#'
#' Bug reports: \url{https://github.com/PredictiveEcology/SpaDES/issues}
#'
#' Module repository: \url{https://github.com/PredictiveEcology/SpaDES-modules}
#'
#' Wiki: \url{https://github.com/PredictiveEcology/SpaDES/wiki}
#'
#' @name SpaDES-package
#' @aliases SpaDES SpaDES-package spades-package
#' @docType package
#' @author Alex M. Chubaty \email{alexander.chubaty@@canada.ca}
#' @author Eliot J. B. McIntire \email{eliot.mcintire@@canada.ca}
#' @keywords package
#'
#' ------------------------------------------------------------------------------------------
#' @section 1 Spatial discrete event simulation (\code{SpaDES}):
#'
#' A collection of top-level functions for doing spatial discrete event simulation.
#'
#' @section 1.1 Simulations:
#'
#' There are two workhorse functions that initialize and run a simulation, and third
#' function for doing multiple spades runs:
#'
#' \tabular{ll}{
#'   \code{\link{simInit}} \tab Initialize a new simulation\cr
#'   \code{\link{spades}} \tab Run a discrete event simulation\cr
#'   \code{\link{experiment}} \tab Run multiple \code{\link{spades}} calls\cr
#' }
#'
#' @section 1.2 Events:
#'
#' Within a module, important simulation functions include:
#'
#' \tabular{ll}{
#'   \code{\link{scheduleEvent}} \tab Schedule a simulation event\cr
#'   \code{removeEvent} \tab Remove an event from the simulation queue (not yet implemented)\cr
#' }
#'
#' ##########################################################################
#'
#' @section 1.2 \code{simList} methods:
#'
#' Collections of commonly used functions to retrieve or set slots (and their elements)
#' of a \code{\link{simList}} object are summarized further below.
#'
#' @section 1.2.1 Simulation parameters:
#'
#' \tabular{ll}{
#'    \code{\link{globals}} \tab List of global simulation parameters.\cr
#'    \code{\link{params}} \tab Nested list of all simulation parameter.\cr
#'    \code{\link{P}} \tab Namespaced version of \code{\link{params}}
#'                         (i.e., do not have to specify module name).\cr
#' }
#'
#' @section 1.2.2 loading from disk, saving to disk:
#'
#' \tabular{ll}{
#'    \code{\link{inputs}} \tab List of loaded objects used in simulation. (advanced)\cr
#'    \code{\link{outputs}} \tab List of objects to save during simulation. (advanced)\cr
#' }
#'
#' @section 1.2.3 objects in simList:
#'
#' \tabular{ll}{
#'    \code{\link{ls}}, \code{\link{objects}} \tab Names of objects referenced by the simulation environment.\cr
#'    \code{\link{ls.str}} \tab List the structure of the simList objects.\cr
#'    \code{\link{objs}} \tab List of objects referenced by the simulation environment.\cr
#' }
#'
#' @section 1.2.4 Simulation paths:
#'
#' Accessor functions for the \code{paths} slot and its elements.
#' \tabular{lll}{
#'    \code{\link{cachePath}} \tab Global simulation cache path.\cr
#'    \code{\link{modulePath}} \tab Global simulation module path.\cr
#'    \code{\link{inputPath}} \tab Global simulation input path.\cr
#'    \code{\link{outputPath}} \tab Global simulation output path.\cr
#'    \code{\link{paths}} \tab Global simulation paths (cache, modules, inputs, outputs).\cr
#' }
#'
#' @section 1.2.5 Simulation times:
#'
#' Accessor functions for the \code{simtimes} slot and its elements.
#'
#' \tabular{ll}{
#'    \code{\link{time}} \tab Current simulation time, in units of longest module.\cr
#'    \code{\link{start}} \tab Simulation start time, in units of longest module.\cr
#'    \code{\link{end}} \tab Simulation end time, in units of longest module.\cr
#'    \code{\link{times}} \tab List of all simulation times (current, start, end), in units of longest module..\cr
#' }
#'
#' @section 1.2.6 Simulation event queues:
#'
#' Accessor functions for the \code{events} and \code{completed} slots.
#' By default, the event lists are shown when the \code{simList} object is printed,
#' thus most users will not require direct use of these methods.
#'
#' \tabular{ll}{
#'    \code{\link{events}} \tab Scheduled simulation events (the event queue). (advanced)\cr
#'    \code{\link{current}} \tab Currently executing event. (advanced)\cr
#'    \code{\link{completed}} \tab Completed simulation events. (advanced)\cr
#' }
#'
#' @section 1.2.7 Modules and dependencies:
#'
#' Accessor functions for the \code{depends}, \code{modules},
#' and \code{.loadOrder} slots.
#' These are included for advanced users.
#'
#' \tabular{ll}{
#'    \code{\link{depends}} \tab List of simulation module dependencies. (advanced)\cr
#'    \code{\link{modules}} \tab List of simulation modules to be loaded. (advanced)\cr
#' }
#'
#' @section 1.2.8 simList environment:
#'
#' The \code{\link{simList}} has a slot called \code{.envir} which is an environment.
#' All objects in the simList are actually in this environment, i.e., the simList is
#' not entirely just a list. In R, environments use pass-by-reference semantics, which means that
#' copying an simList object using normal R assignment operation, e.g., sim2 <- sim1,
#' will not copy the objects contained within the .envir slot. The two objects sim1 and
#' sim2 will shared identical objects within that slot. Sometimes, this not desired, and
#' a true copy is required.
#'
#' \tabular{ll}{
#'    \code{\link{envir}} \tab Access the environment of the simList directly (advanced)\cr
#'    \code{\link{copy}} \tab Deep copy of a simList. (advanced)\cr
#' }
#'
#' @section 1.2.9 Checkpointing:
#'
#' \tabular{lll}{
#'    Accessor method \tab Module \tab Description\cr
#'    \code{\link{checkpointFile}} \tab \code{.checkpoint} \tab Name of the checkpoint file. (advanced)\cr
#'    \code{\link{checkpointInterval}} \tab \code{.checkpoint} \tab The simulation checkpoint interval. (advanced)\cr
#'  }
#'
#' @section 1.2.10 Progress Bar:
#'
#' \tabular{lll}{
#'    \code{\link{progressType}} \tab \code{.progress} \tab Type of graphical progress bar used. (advanced)\cr
#'    \code{\link{progressInterval}} \tab \code{.progress} \tab Interval for the progress bar. (advanced)\cr
#' }
#'
#' ##########################################################################
#'
#' @section 1.3 Module operations:
#'
#' Modules are the basic unit of \code{SpaDES}.
#' These are generally created and stored locally, or are downloaded from remote repositories,
#' including our
#' \href{https://github.com/PredictiveEcology/SpaDES-modules}{SpaDES-modules repository on GitHub}.
#'
#' \tabular{ll}{
#'   \code{\link{checksums}} \tab Verify (and optionally write) checksums for a module's data files. \cr
#'   \code{\link{downloadModule}} \tab Open all modules nested within a base directory\cr
#'   \code{\link{getModuleVersion}} \tab Get the latest module version # from module repository\cr
#'   \code{\link{newModule}} \tab Create new module from template\cr
#'   \code{\link{newModuleDocumentation}} \tab Create empty documentation for a new module\cr
#'   \code{\link{openModules}} \tab Open all modules nested within a base directory\cr
#'   \code{\link{moduleMetadata}} \tab Shows the module metadata\cr
#'   \code{\link{zipModule}} \tab Zip a module and its associated files\cr
#' }
#'
#' @section 1.4 Module metadata:
#'
#' Each module requires several items to be defined.
#' These comprise the metadata for that module (including default parameter specifications,
#'  inputs and outputs), and are currently written at the top of the module's \code{.R} file.
#'
#' \tabular{ll}{
#'   \code{\link{defineModule}} \tab Define the module metadata\cr
#'   \code{\link{defineParameter}} \tab Specify a parameter's name, value and set a default\cr
#'   \code{\link{expectsInput}} \tab Specify an input object's name, class, description, sourceURL and other specifications\cr
#'   \code{\link{createsOutput}} \tab Specify an output object's name, class, description and other specifications\cr
#' }
#'
#' @section 1.5 Module dependencies:
#'
#' Once a set of modules have been chosen, the dependency information is automatically
#' calculated once simInit is run. There are several functions to assist with dependency
#' information:
#'
#' \tabular{ll}{
#'   \code{\link{depsEdgeList}} \tab Build edge list for module dependency graph\cr
#'   \code{\link{depsGraph}} \tab Build a module dependency graph using \code{igraph}\cr
#' }
#'
#' @section 1.6 Exported \code{SpaDES} object classes:
#'
#' \tabular{ll}{
#'   \code{\link{simList}} \tab The 'simList' class\cr
#' }
#'
#' @section 1.7 Caching:
#'
#' Caching can be done in a variety of ways, most of which are up to the module developer. However,
#' the one most common usage would be to cache a simulation run. This might be useful if a simulation
#' is very long, has been run once, and the goal is just to retrieve final results. This would be
#' an alternative to manually saving the outputs.
#'
#' See example in \code{\link{spades}}, achieved by using \code{cache = TRUE} argument.
#'
#' \tabular{ll}{
#'   \code{\link{cache}} \tab Caches a spades call, but often used as arg in \code{\link{spades}}\cr
#'   \code{\link{showCache}} \tab Shows information about the objects in the cache\cr
#'   \code{\link{clearCache}} \tab Removes objects from the cache\cr
#'   \code{\link{clearStubArtifacts}} \tab Removes some errors in cached files\cr
#' }
#'
#' A module developer can build caching into their module by creating cached versions of their
#' functions.
#'
#'
#'
#' ------------------------------------------------------------------------------------------
#' @section 2 Module functions:
#'
#' A collection of functions that help with making modules, in addition to all the other R packages and code.
#'
#' @section 2.1 Spatial spreading/distances methods:
#'
#' Spatial contagion is a key phenomenon for spatially explicit simulation models. Contagion can
#' be modelled using discrete approaches or continuous approaches. Several \code{SpaDES} functions assist
#' with these:
#'
#' \tabular{ll}{
#'   \code{\link{spread}} \tab Contagious cellular automata\cr
#'   \code{\link{rings}} \tab Identify rings around focal cells (e.g., buffers and donuts)\cr
#'   \code{\link{adj}} \tab An optimized (i.e., faster) version of \code{\link[raster]{adjacent}}\cr
#'   \code{\link{cir}} \tab Identify pixels in a circle around a \code{\link[sp:SpatialPoints-class]{SpatialPoints*}} object\cr
#'   \code{\link{distanceFromEachPoint}} \tab Fast calculation of distance surfaces\cr
#' }
#'
#'
#' @section 2.2 Spatial agent methods:
#'
#' Agents have several methods and functions specific to them:
#'
#' \tabular{ll}{
#'   \code{\link{crw}} \tab Simple correlated random walk function\cr
#'   \code{\link{heading}} \tab Determines the heading between SpatialPoints*\cr
#'   \code{\link{makeLines}} \tab Makes \code{SpatialLines} object for, e.g., drawing arrows\cr
#'   \code{\link{move}} \tab A meta function that can currently only take "crw"\cr
#'   \code{\link{specificNumPerPatch}} \tab Initiate a specific number of agents per patch\cr
#' }
#'
#' @section 2.3 GIS operations:
#'
#' In addition to the vast amount of GIS operations available in R (mostly from
#' contributed packages such as \code{sp}, \code{raster}, \code{maps}, \code{maptools}
#' and many others), we provide the following GIS-related functions:
#' \tabular{ll}{
#'   \code{\link{equalExtent}} \tab Assess whether a list of extents are all equal\cr
#' }
#'
#' @section 2.4 Map-reduce - type operations:
#'
#' These functions convert between reduced and mapped representations of the same data.
#' This allows compact representation of, e.g., rasters that have many individual pixels
#' that share identical information.

#' \tabular{ll}{
#'   \code{\link{rasterizeReduced}} \tab Convert reduced representation to full raster\cr
#' }
#'
#' @section 2.5 Colors in Raster* objects:
#'
#' We likely will not want the default colours for every map.
#' Here are several helper functions to add to, set and get colors of \code{Raster*} objects:

#' \tabular{ll}{
#'   \code{\link[SpaDES:setColors<-]{setColors}} \tab Set colours for plotting \code{Raster*} objects\cr
#'   \code{\link{getColors}} \tab Get colours in a \code{Raster*} objects\cr
#'   \code{\link{divergentColors}} \tab Create a color palette with diverging colors around a middle\cr
#' }
#'
#' @section 2.6 Random Map Generation:
#'
#' It is often useful to build dummy maps with which to build simulation models before all data are available.
#' These dummy maps can later be replaced with actual data maps.
#'
#' \tabular{ll}{
#'   \code{\link{gaussMap}} \tab Creates a random map using gaussian random fields\cr
#'   \code{\link{randomPolygons}} \tab Creates a random polygon with specified number of classes\cr
#' }
#'
#' @section 2.7 Checking for the existence of objects:
#'
#' \code{SpaDES} modules will often require the existence of objects in the \code{simList}.
#' These are helpers for assessing this:
#'
#' \tabular{ll}{
#'   \code{\link{checkObject}} \tab Check for a existence of an object within a \code{simList} \cr
#'   \code{\link{checkPath}} \tab Checks the specified filepath for formatting consistencies\cr
#' }
#'
#' @section 2.8 SELES-type approach to simulation:
#'
#' These functions are essentially skeletons and are not fully implemented.
#' They are intended to make translations from \href{http://www.gowlland.ca/}{SELES}.
#' You must know how to use SELES for these to be useful:
#' \tabular{ll}{
#'   \code{\link{agentLocation}} \tab Agent location\cr
#'   \code{\link{initiateAgents}} \tab Initiate agents into a SpatialPointsDataFrame\cr
#'   \code{\link{numAgents}} \tab Number of agents\cr
#'   \code{\link{probInit}} \tab Probability of intiating an agent or event\cr
#'   \code{\link{transitions}} \tab Transition probability\cr
#' }
#'
#' @section 2.9 Miscellaneous:
#'
#' Functions that may be useful within a \code{SpaDES} context
#' \tabular{ll}{
#'   \code{\link{inRange}} \tab Test whether a number lies within range [a,b]\cr
#'   \code{\link{layerNames}} \tab Get layer names for numerous object classes\cr
#'   \code{\link{loadPackages}} \tab Simple wrapper for loading packages\cr
#'   \code{\link{numLayers}} \tab Return number of layers\cr
#'   \code{\link{paddedFloatToChar}} \tab Wrapper for padding (e.g., zeros) floating numbers to character\cr
#'   \code{\link{updateList}} \tab Update values in a named list\cr
#' }
#'
#' ------------------------------------------------------------------------------------------
#' @section 3 Plotting:
#' There are several user-accessible plotting functions that are optimized for modularity
#' and speed of plotting:
#'
#' Commonly used:
#' \tabular{ll}{
#'   \code{\link{Plot}} \tab The workhorse plotting function\cr
#' }
#'
#' Simulation diagrams:
#' \tabular{ll}{
#'   \code{\link{eventDiagram}} \tab Gantt chart representing the events in a completed simulation.\cr
#'   \code{\link{moduleDiagram}} \tab Network diagram of simplified module (object) dependencies.\cr
#'   \code{\link{objectDiagram}} \tab Sequence diagram of detailed object dependencies.\cr
#' }
#'
#' Other useful plotting functions:
#' \tabular{ll}{
#'   \code{\link{clearPlot}} \tab Helpful for resolving many errors\cr
#'   \code{\link{clickValues}} \tab Extract values from a raster object at the mouse click location(s)\cr
#'   \code{\link{clickExtent}} \tab Zoom into a raster or polygon map that was plotted with \code{\link{Plot}}\cr
#'   \code{\link{clickCoordinates}} \tab Get the coordinates, in map units, under mouse click\cr
#'   \code{\link{dev}} \tab Specify which device to plot on, making a non-RStudio one as default\cr
#'   \code{\link{newPlot}} \tab Open a new default plotting device\cr
#'   \code{\link{rePlot}} \tab Replots all elements of device for refreshing or moving plot\cr
#' }
#'
#' ------------------------------------------------------------------------------------------
#' @section 4 File operations:
#'
#' In addition to R's file operations, we have added several here to aid in bulk
#' loading and saving of files for simulation purposes:
#'
#' \tabular{ll}{
#'   \code{\link{getFileName}} \tab Get the name of current file\cr
#'   \code{\link{loadFiles}} \tab Load simulation objects according to a filelist\cr
#'   \code{\link{rasterToMemory}} \tab Read a raster from file to RAM\cr
#'   \code{\link{saveFiles}} \tab Save simulation objects according to outputs and params\cr
#' }
#'
#' ------------------------------------------------------------------------------------------
#' @section 5 Sample data and modules included in package:
#'
#' Five maps and three modules are included within the \code{SpaDES} package
#'
#' @section 5.1 Data:
#'
#' Several dummy data sets are included for testing of functionality
#' \tabular{ll}{
#'   \code{\link{spadesMaps}} \tab Help showing included maps\cr
#' }
#'
#' @section 5.2 Modules:
#'
#' Several dummy modules are included for testing of functionality. These can be
#' found with \code{file.path(find.package("SpaDES"), "sampleModules")}
#' \tabular{ll}{
#'   \code{randomLandscapes} \tab Imports, updates, and plots several raster map layers\cr
#'   \code{caribouMovement} \tab A simple agent-based (a.k.a., individual-based) model\cr
#'   \code{fireSpread} \tab A simple model of a spatial spread process\cr
#' }
NULL

################################################################################
# data documentation
#

#' Dummy maps included with \code{SpaDES}
#'
#' All maps included with SpaDES are randomly generated maps created by \code{gaussMap()}.
#' These are located within the \code{maps} folder of the package, and are used in the vignettes.
#' Use \code{system.file(package="SpaDES", "maps")} to locate the \code{maps} directory on your system.
#'
#' @details
#' \code{DEM.tif}: converted to a a small number of discrete levels (in 100m hypothetical units)
#'
#' @docType data
#' @keywords maps
#' @name spadesMaps
#' @rdname spadesMaps
#' @format raster
NULL

#' @details
#' \code{habitatQuality.tif}: made to look like a continuous habitat surface, rescaled to 0 to 1
#'
#' @docType data
#' @keywords maps
#' @name spadesMaps
#' @rdname spadesMaps
#' @format raster
NULL

#' @details
#' \code{forestAge.tif}: rescaled to possible forest ages in a boreal forest setting
#'
#' @docType data
#' @keywords maps
#' @name spadesMaps
#' @rdname spadesMaps
#' @format raster
NULL

#' @details
#' \code{forestCover.tif}: rescaled to possible forest cover in a boreal forest setting
#'
#' @docType data
#' @keywords maps
#' @name spadesMaps
#' @rdname spadesMaps
#' @format raster
NULL

#' @details
#' \code{percentPine.tif}: rescaled to percentages.
#'
#' @docType data
#' @keywords maps
#' @name spadesMaps
#' @rdname spadesMaps
#' @format raster
NULL

################################################################################
# package imports
# See \url{http://r-pkgs.had.co.nz/namespace.html#imports}

#' @import graphics
NULL

#' @import igraph
NULL

#' @import methods
NULL

#' @import utils
NULL
