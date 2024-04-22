<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.7.12/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container mt-3">
    <h2>Student Management System</h2>
    <button class="btn btn-primary my-2" data-toggle="modal" data-target="#insertModal">Add New Student</button>
    <table class="table">
        <thead>
        <tr>
            <th>RollNo</th>
            <th>Name</th>
            <th>City</th>
            <th>Marks</th>
            <th>Operations</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","shiv");
                Statement st = con.createStatement();

                ResultSet rs = st.executeQuery("select * from test");
                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td>
                <button class="btn btn-success open-UpdateDialog"
                        data-toggle="modal" data-target="#updateModal">Edit</button>
                <button class="btn btn-danger open-DeleteDialog"
                        data-toggle="modal" data-target="#deleteModal">Delete</button>
            </td>
        </tr>
        <%
                }
                rs.close();
                st.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        </tbody>
    </table>
</div>

<!-- Insert Modal -->
<div class="modal" id="insertModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add New Student</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="<%= request.getRequestURI() %>" method="post">
                    <div class="form-group">
                        <label for="srollno">RollNo:</label>
                        <input type="text" class="form-control" id="srollno" name="sroll" placeholder="Enter roll no" required>
                    </div>
                    <div class="form-group">
                        <label for="sname">Name:</label>
                        <input type="text" class="form-control" id="sname" name="sname" placeholder="Enter name" required>
                    </div>
                    <div class="form-group">
                        <label for="scity">City:</label>
                        <input type="text" class="form-control" id="scity" name="scity" placeholder="Enter city" required>
                    </div>
                    <div class="form-group">
                        <label for="smarks">Marks:</label>
                        <input type="text" class="form-control" id="smarks" name="smarks" placeholder="Enter marks" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Update Modal -->
<!-- Update Modal -->
<div class="modal" id="updateModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Update Student</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="<%= request.getRequestURI() %>" method="post">
                    <input type="hidden" name="rollno" id="updateId">
                    <div class="form-group">
                        <label for="updateName">Name:</label>
                        <input type="text" class="form-control" id="updateName" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="updateCity">City:</label>
                        <input type="text" class="form-control" id="updateCity" name="city" required>
                    </div>
                    <div class="form-group">
                        <label for="updateMarks">Marks:</label>
                        <input type="text" class="form-control" id="updateMarks" name="marks" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Delete Modal -->
<div class="modal" id="deleteModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Delete Student</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="DeleteServlet" method="post">
                    <p>Are you sure you want to delete this student?</p>
                    <input type="hidden" name="id" id="deleteId">
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
