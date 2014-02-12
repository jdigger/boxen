# Project Manifests

Project manifests live in `modules/projects/manifests/${project}.pp`, where
`$project` is the name of the project.

To modularize further for a single user, create a subdirectory with the
project name and put the additional manifests in there.


## Hiera

Hiera data is also supported per-user and per-project.

See [`/opt/boxen/repo/config/hiera.yaml`](../../config/hiera.yaml) for the specifics.

**A LOT OF CONFIGURATION IS DONE VIA HIERA** so it is worth understanding how that works.


## Facter Facts

Projects are "selected" by way of "facts" and control the order in which Hiera
data is discovered. For example, given a `~/.boxen/config.json` file
```json
{
  "boxen_project_01": "omega",
  "boxen_project_02": "developer"
}
```
then both the "omega" and "developer" projects will be applied, and Hiera settings in "omega" will take precidence over settings in "developer."
