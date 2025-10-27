script_folder="/home/admin/Desktop/proto/build"
echo "echo Restoring environment" > "$script_folder/deactivate_conanbuildenv-release-x86_64.sh"
for v in QT_PLUGIN_PATH QT_HOST_PATH
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "$script_folder/deactivate_conanbuildenv-release-x86_64.sh"
    else
        echo unset $v >> "$script_folder/deactivate_conanbuildenv-release-x86_64.sh"
    fi
done


export QT_PLUGIN_PATH="/home/admin/.conan2/p/b/qt0c1d938d30a94/p/plugins"
export QT_HOST_PATH="/home/admin/.conan2/p/b/qt0c1d938d30a94/p"