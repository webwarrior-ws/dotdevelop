using Gtk;

namespace MonoDevelop.DesignerSupport
{

	public interface IPropertyGrid : IPropertyPad
	{
		bool ShowToolbar { get; set; }
		bool ShowHelp { get; set; }
		bool Sensitive { get; set; }
		string Name { get; set; }
		object CurrentObject { get; set; }

		Gtk.Widget Widget { get; }
		ShadowType ShadowType { get; set; }

		void Hide ();
		void Show ();

		void SetToolbarProvider (object toolbarProvider);
		void CommitPendingChanges ();
	}

}