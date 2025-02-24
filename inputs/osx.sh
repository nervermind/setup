osx_defaults=(
    '{"name": "com.apple.finder ShowExternalHardDrivesOnDesktop", "command": "write", "type": "-bool", "value": "true"}'
    '{"name": "com.apple.finder ShowHardDrivesOnDesktop", "command": "write", "type": "-bool", "value": "false"}'
    '{"name": "com.apple.finder ShowRemovableMediaOnDesktop", "command": "write", "type": "-bool", "value": "true"}'
    '{"name": "Apple Global Domain AppleShowAllExtensions", "command": "write", "type": "-bool", "value": "true"}'
    '{"name": "com.apple.Safari.SandboxBroker ShowDevelopMenu", "command": "write", "type": "-bool", "value": "true"}'
    '{"name": "com.apple.dock autohide", "command": "write", "type": "-bool", "value": "true"}'
    '{"name": "com.apple.dock tilesize", "command": "write", "type": "-float", "value": "41"}'
)

:'for item in "${osx_defaults[@]}"; do
    name=$(echo "$item" | jq -r '.name')
    command=$(echo "$item" | jq -r '.command')
    type=$(echo "$item" | jq -r '.type')
    value=$(echo "$item" | jq -r '.value')
    echo "defaults $command $name $type $value"
done
'