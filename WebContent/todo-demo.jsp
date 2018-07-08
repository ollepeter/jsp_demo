<%@ page import="java.util.*" %>

<html>
<body>

<!-- Step 1: Create HTML form -->
<form action="todo-demo.jsp">
	Add new item: <input type="text" name="theItem" />
	
	<input type="submit" value="Submit"/>
</form>

<!-- Step 2: Add new to "To Do" list -->
<%
	// get the ToDo items from the Session
	@SuppressWarnings("unchecked")
	List<String> items = (List<String>) session.getAttribute("myToDoList");
	
// if the ToDo items doesn't exist create a new one
	if(items == null) {
		items = new ArrayList<String>();
		session.setAttribute("myToDoList", items);
	}
	
	// see if there is any form data to add
	String  theItem = request.getParameter("theItem");
	if(theItem != null && !theItem.trim().equals("")) {
		items.add(theItem);
	}
%>
<hr> <!-- this is just a horizontal line -->

<!-- Step 3: Display all "To Do" item from Session -->
<b>To list items </b> <br/>
<ol>
<%
	for(String temp : items) {
		out.println("<li>" + temp + "</li>");
	}
%>

</ol>
</body>
</html>