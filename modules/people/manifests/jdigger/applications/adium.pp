# == Description
#
# Settings for Adium
#
class people::jdigger::applications::adium {

  $home = "/Users/${::boxen_user}"

  property_list_key { 'Adium users':
    path       => "${home}/Library/Application Support/Adium 2.0/Users/Default/Accounts.plist",
    key        => 'Accounts',
    value      => [
      {
        'Service'  => 'GTalk',
        'UID'      => 'moore.jim@gmail.com',
        'Type'     => 'libpurple-jabber-gtalk',
        'ObjectID' => '1',
      },
      {
        'Service'  => 'Yahoo!',
        'UID'      => 'jim_moore',
        'Type'     => 'libpurple-Yahoo!',
        'ObjectID' => '2',
      },
      {
        'Service'  => 'AIM',
        'UID'      => 'jdiggerj',
        'Type'     => 'libpurple-oscar-AIM',
        'ObjectID' => '3',
      },
    ],
    value_type => 'array',
  }

  # property_list_key { 'Adium MetaContact Ownership':
  #   path       => "${home}/Library/Application Support/Adium 2.0/Users/Default/Contact List.plist",
  #   key        => 'MetaContact Ownership',
  #   value      => {
  #     'MetaContact-7' => [
  #       {
  #         'UID' => 'jeffscelza76@gmail.com',
  #         'ServiceID' => 'AIM'
  #       },
  #       {
  #         'UID' => '2ndkdhkrvyyjx2fg06hwugms6n@public.talk.google.com',
  #         'ServiceID' => 'GTalk'
  #       }
  #     ],
  #     'MetaContact-3' => [
  #       {
  #         'UID' => 'forrest_murphy',
  #         'ServiceID' => 'Yahoo!'
  #       },
  #       {
  #         'UID' => 'forrestmurphy',
  #         'ServiceID' => 'AIM'
  #       }
  #     ],
  #     'MetaContact-8' => [
  #       {
  #         'UID' => 'wobes17',
  #         'ServiceID' => 'AIM'
  #       },
  #       {
  #         'UID' => 'greg.wobermin@gmail.com',
  #         'ServiceID' => 'GTalk'
  #       }
  #     ],
  #     'MetaContact-4' => [
  #       {
  #         'UID' => 'ckhannah34',
  #         'ServiceID' => 'AIM'
  #       },
  #       {
  #         'UID' => 'channah@planethannah.com',
  #         'ServiceID' => 'Jabber'
  #       }
  #     ],
  #     'MetaContact-20' => [
  #       {
  #         'UID' => 'reuscat',
  #         'ServiceID' => 'AIM'
  #       },
  #       {
  #         'UID' => 'creusswig@gmail.com',
  #         'ServiceID' => 'GTalk'
  #       }
  #     ],
  #     'MetaContact-9' => [
  #       {
  #         'UID' => 'twcstreet',
  #         'ServiceID' => 'AIM'
  #       },
  #       {
  #         'UID' => 'brian.c.street@gmail.com',
  #         'ServiceID' => 'GTalk'
  #       }
  #     ],
  #     'MetaContact-5' => [
  #       {
  #         'UID' => 'aubrey.alford@gmail.com',
  #         'ServiceID' => 'AIM'
  #       },
  #       {
  #         'UID' => 'aubrey.alford@gmail.com',
  #         'ServiceID' => 'GTalk'
  #       }
  #     ],
  #     'MetaContact-1' => [
  #       {
  #         'UID' => 'email@stephencopp.com',
  #         'ServiceID' => 'Jabber'
  #       },
  #       {
  #         'UID' => 'eastephencopp',
  #         'ServiceID' => 'AIM'
  #       }
  #     ],
  #     'MetaContact-21' => [
  #       {
  #         'UID' => 'asweettchr@gmail.com',
  #         'ServiceID' => 'GTalk'
  #       }
  #     ],
  #     'MetaContact-6' => [
  #       {
  #         'UID' => 'iupula@gmail.com',
  #         'ServiceID' => 'GTalk'
  #       },
  #       {
  #         'UID' => 'iupula',
  #         'ServiceID' => 'AIM'
  #       }
  #     ],
  #     'MetaContact-10' => [
  #       {
  #         'UID' => 'lschieffer@gmail.com',
  #         'ServiceID' => 'GTalk'
  #       },
  #       {
  #         'UID' => 'skiingco1',
  #         'ServiceID' => 'AIM'
  #       }
  #     ],
  #     'MetaContact-2' => [
  #       {
  #         'UID' => 'hsfear@gmail.com',
  #         'ServiceID' => 'GTalk'
  #       },
  #       {
  #         'UID' => 'hsfear',
  #         'ServiceID' => 'AIM'
  #       }
  #     ]
  #   },
  #   value_type => 'hash',
  # }

  # property_list_key { 'Adium FlatMetaContacts':
  #   path       => "${home}/Library/Application Support/Adium 2.0/Users/Default/Contact List.plist",
  #   key        => 'FlatMetaContacts',
  #   value      => [
  #     'MetaContact-7',
  #     'MetaContact-3',
  #     'MetaContact-8',
  #     'MetaContact-4',
  #     'MetaContact-20',
  #     'MetaContact-9',
  #     'MetaContact-5',
  #     'MetaContact-1',
  #     'MetaContact-21',
  #     'MetaContact-6',
  #     'MetaContact-10',
  #     'MetaContact-2'
  #   ],
  #   value_type => 'array',
  # }

  # property_list_key { 'Adium Contact Alerts':
  #   path       => "${home}/Library/Application Support/Adium 2.0/Users/Default/Contact Alerts.plist",
  #   key        => 'Contact Alerts',
  #   value      => {
  #     'Interface_ErrorMessageReceived' => [
  #       {
  #         'EventID' => 'Interface_ErrorMessageReceived',
  #         'ActionID' => 'Growl'
  #       },
  #       {
  #         'ActionDetails' => {
  #           'BehaviorType' => 2
  #         },
  #         'EventID' => 'Interface_ErrorMessageReceived',
  #         'ActionID' => 'BounceDockIcon'
  #       }
  #     ],
  #     'FileTransfer_Failed' => [
  #       {
  #         'EventID' => 'FileTransfer_Failed',
  #         'ActionID' => 'Growl'
  #       }
  #     ],
  #     'FileTransfer_Request' => [
  #       {
  #         'EventID' => 'FileTransfer_Request',
  #         'ActionID' => 'Growl'
  #       }
  #     ],
  #     'Content_MessageReceived' => [
  #       {
  #         'ActionDetails' => {
  #           'BehaviorType' => 1
  #         },
  #         'EventID' => 'Content_MessageReceived',
  #         'ActionID' => 'BounceDockIcon'
  #       },
  #       {
  #         'EventID' => 'Content_MessageReceived',
  #         'ActionID' => 'DockOverlay'
  #       },
  #       {
  #         'EventID' => 'Content_MessageReceived',
  #         'ActionDetails' => {
  #           'SoundPath' => '$$BundlePath$$\/Contents\/Resources\/Sounds\/AIM.AdiumSoundset\/Receive IM.aif'
  #         },
  #         'ActionID' => 'PlaySound'
  #       }
  #     ],
  #     'Content_MessageReceivedBackground' => [
  #       {
  #         'EventID' => 'Content_MessageReceivedBackground',
  #         'ActionID' => 'Growl'
  #       },
  #       {
  #         'EventID' => 'Content_MessageReceivedBackground',
  #         'ActionID' => 'DockOverlay'
  #       }
  #     ],
  #     'FileTransfer_Complete' => [
  #       {
  #         'EventID' => 'FileTransfer_Complete',
  #         'ActionID' => 'Growl'
  #       }
  #     ],
  #     'Content_MessageReceivedFirst' => [
  #       {
  #         'EventID' => 'Content_MessageReceivedFirst',
  #         'ActionDetails' => {
  #           'SoundPath' => '$$BundlePath$$\/Contents\/Resources\/Sounds\/AIM.AdiumSoundset\/Receive 1st IM.aif'
  #         },
  #         'ActionID' => 'PlaySound'
  #       }
  #     ],
  #     'Account_Connected' => [
  #       {
  #         'EventID' => 'Account_Connected',
  #         'ActionDetails' => {
  #           'SoundPath' => '$$BundlePath$$\/Contents\/Resources\/Sounds\/AIM.AdiumSoundset\/Welcome.aif'
  #         },
  #         'ActionID' => 'PlaySound'
  #       }
  #     ]
  #   },
  #   value_type => 'hash',
  # }

}
