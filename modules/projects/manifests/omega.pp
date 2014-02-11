# == Description
#
# Machine configuration specific for the "Omega"
# (timewarnercable.com) project.
#
# Should be used in conjunction with the "developer" project.
#
class projects::omega {

  include 'packages::java7'
  include 'projects::omega::repositories'

  # vagrant::box { 'Omega AEM 5.6 Base 20140107':
  #   source => 'http://10.143.47.12:8888/owncloud/public.php?service=files&t=910d7facc1f51c6767e0a5a2f391d5c1&download&path=/base_omega_56_20140107.box'
  # }

}
