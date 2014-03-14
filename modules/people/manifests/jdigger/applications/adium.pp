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

  people::jdigger::applications::adium_pref { 'Adium contact sorting':
    file  => 'Sorting',
    key   => 'Sort Mode',
    value => 'Alphabetical',
  }

  people::jdigger::applications::adium_pref { 'Adium tab switching':
    file  => 'Chat Cycling',
    key   => 'Tab Switching Keys',
    value => 2, # Brackets: Cmd-[  Cmd-]
  }

  people::jdigger::applications::adium_pref { 'Adium message display style path':
    file  => 'WebKit Message Display',
    key   => 'Current Style Path',
    value => '$$BundlePath$$/Contents/Resources/Message Styles/Stockholm.AdiumMessageStyle',
  }

  people::jdigger::applications::adium_pref { 'Adium message display style name':
    file  => 'WebKit Message Display',
    key   => 'Message Style',
    value => 'im.adium.Stockholm.style',
  }

  property_list_key { 'Adium Contact Alerts':
    path       => "${home}/Library/Application Support/Adium 2.0/Users/Default/Contact Alerts.plist",
    key        => 'Contact Alerts',
    value      => {
      'Interface_ErrorMessageReceived'    => [
        {
          'EventID'  => 'Interface_ErrorMessageReceived',
          'ActionID' => 'Growl'
        },
        {
          'ActionDetails' => {
            'BehaviorType' => 2
          },
          'EventID'       => 'Interface_ErrorMessageReceived',
          'ActionID'      => 'BounceDockIcon'
        }
      ],
      'FileTransfer_Failed'               => [
        {
          'EventID'  => 'FileTransfer_Failed',
          'ActionID' => 'Growl'
        }
      ],
      'FileTransfer_Request'              => [
        {
          'EventID'  => 'FileTransfer_Request',
          'ActionID' => 'Growl'
        }
      ],
      'Content_MessageReceived'           => [
        {
          'ActionDetails'  => {
            'BehaviorType' => 1
          },
          'EventID'        => 'Content_MessageReceived',
          'ActionID'       => 'BounceDockIcon'
        },
        {
          'EventID'  => 'Content_MessageReceived',
          'ActionID' => 'DockOverlay'
        },
        {
          'EventID'       => 'Content_MessageReceived',
          'ActionDetails' => {
            'SoundPath' => '$$BundlePath$$/Contents/Resources/Sounds/AIM.AdiumSoundset/Receive IM.aif'
          },
          'ActionID'      => 'PlaySound'
        }
      ],
      'Content_MessageReceivedBackground' => [
        {
          'EventID'  => 'Content_MessageReceivedBackground',
          'ActionID' => 'Growl'
        },
        {
          'EventID'  => 'Content_MessageReceivedBackground',
          'ActionID' => 'DockOverlay'
        }
      ],
      'FileTransfer_Complete'             => [
        {
          'EventID'  => 'FileTransfer_Complete',
          'ActionID' => 'Growl'
        }
      ],
      'Content_MessageReceivedFirst'      => [
        {
          'EventID'       => 'Content_MessageReceivedFirst',
          'ActionDetails' => {
            'SoundPath' => '$$BundlePath$$/Contents/Resources/Sounds/AIM.AdiumSoundset/Receive 1st IM.aif'
          },
          'ActionID'      => 'PlaySound',
        }
      ],
      'Account_Connected'                 => [
        {
          'EventID'       => 'Account_Connected',
          'ActionDetails' => {
            'SoundPath' => '$$BundlePath$$/Contents/Resources/Sounds/AIM.AdiumSoundset/Welcome.aif'
          },
          'ActionID'      => 'PlaySound',
        }
      ]
    },
    value_type => 'hash',
  }

}
