# How to conditionally disable the UpdateButton in client code


<p>This functionality can be achieved using templates. To be able to mimic the command columns behavior, I used ASPxHyperlinks in the column's DataItemTemplate and EditItemTemplate Containers. The HtmlRoewCreated event is used to set the Edit button's NavigateUrl property so that it can start editing a proper row. Also, in this event handler I set the ClientInstanceName property of the Updatebutton. This is done to be able to access the UpdateButton in client code and disable/enable it. This code is implemented in the CellEditorInitialize event handler.<br><br><strong>See also</strong><br><a href="https://www.devexpress.com/Support/Center/p/E2345">How to enable/disable command buttons on the client side</a><br><a href="https://www.devexpress.com/Support/Center/p/E1246">How to create a custom command button with the appearance and action depending on a row state</a><br><a href="https://www.devexpress.com/Support/Center/p/E366">How to customize command buttons in individual rows</a><br><a href="https://www.devexpress.com/Support/Center/p/E351">How to show/hide ASPxGridView custom command buttons using HTML elements </a></p>

<br/>


