using Granite.Widgets;

namespace PythonTester {
public class NoPythonFoundView : Gtk.ScrolledWindow {

    public NoPythonFoundView () {
        var no_python_found_view = new Welcome (
            _("No Python versions found"),
            _("Please install a versions of Python and restart the application.")
        );

        this.add (no_python_found_view);
    }
}
}
