script_folder="/home/admin/Desktop/proto/build"
echo "echo Restoring environment" > "$script_folder/deactivate_conanrunenv-release-x86_64.sh"
for v in LD_LIBRARY_PATH DYLD_LIBRARY_PATH QT_PLUGIN_PATH PATH
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "$script_folder/deactivate_conanrunenv-release-x86_64.sh"
    else
        echo unset $v >> "$script_folder/deactivate_conanrunenv-release-x86_64.sh"
    fi
done


export LD_LIBRARY_PATH="/home/admin/.conan2/p/b/cadmwef0d8e33f7c23/p/lib:/home/admin/.conan2/p/b/iridi0047b5067bf2f/p/lib:/home/admin/.conan2/p/b/qt71c9547cd5498/p/lib:/home/admin/.conan2/p/b/qt71c9547cd5498/p/plugins/imageformats:/home/admin/.conan2/p/b/qt71c9547cd5498/p/plugins/platforms:/home/admin/.conan2/p/b/qt71c9547cd5498/p/plugins/iconengines:$LD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/home/admin/.conan2/p/b/cadmwef0d8e33f7c23/p/lib:/home/admin/.conan2/p/b/iridi0047b5067bf2f/p/lib:/home/admin/.conan2/p/b/qt71c9547cd5498/p/lib:/home/admin/.conan2/p/b/qt71c9547cd5498/p/plugins/imageformats:/home/admin/.conan2/p/b/qt71c9547cd5498/p/plugins/platforms:/home/admin/.conan2/p/b/qt71c9547cd5498/p/plugins/iconengines:$DYLD_LIBRARY_PATH"
export QT_PLUGIN_PATH="/home/admin/.conan2/p/b/qt71c9547cd5498/p/plugins"
export PATH="/home/admin/.conan2/p/b/qt71c9547cd5498/p/bin:$PATH"