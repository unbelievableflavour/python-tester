namespace PythonTester {
public class PythonVersionManager : Object {

    static PythonVersionManager? instance;
    private Settings settings = new Settings ("com.github.bartzaalberg.python-tester");
    string[] python_versions = {};

    PythonVersionManager () {
        get_python_versions ();
    }

    public static PythonVersionManager get_instance () {
        if (instance == null) {
            instance = new PythonVersionManager ();
        }
        return instance;
    }

    private void get_python_versions () {
        try {
            string directory = settings.get_string ("python-path");

            if (directory == "") {
                directory = "/usr/bin";
                settings.set_string ("python-path", directory);
            }

            Dir dir = Dir.open (directory, 0);
            string? name = null;
            while ((name = dir.read_name ()) != null) {
                string path = Path.build_filename (directory, name);
                if (!(FileUtils.test (path, FileTest.IS_EXECUTABLE))) {
                    continue;
                }

                if (!("python" in name)) {
                    continue;
                }

                if ((name.substring (0, 6) != "python")) {
                    continue;
                }

                if (name != "python" && !fourth_char_is_number (name)) {
                    continue;
                }

                string short_string = name.substring (-3);
                int number = int.parse (short_string);

                if (name != "python" && number == 0) {
                    continue;
                }

                python_versions += name;
            }

            if ( !current_saved_version_is_available ()) {
                settings.set_string ("python-version", python_versions[0]);
            }

        } catch (FileError err) {
            stderr.printf (err.message);
        }
    }

    public bool current_saved_version_is_available () {
        if (no_versions_found ()) {
            return false;
        }
        if (!(settings.get_string ("python-version") in python_versions)) {
            return true;
        }
        return true;
    }

    public string[] get_versions () {
        return this.python_versions;
    }

    public bool no_versions_found () {
        return get_versions ().length == 0;
    }

    public bool fourth_char_is_number (string name) {

        if (name.length < 4) {
            return false;
        }

        var fourth_char = name.substring (3, 1);

        if ( int.parse (fourth_char) == 0) {
            return false;
        }

        return true;
    }
}
}
