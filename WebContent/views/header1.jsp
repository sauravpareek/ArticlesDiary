<meta charset="utf-8">
  <meta name="viewport">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<body>

<%-- <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">ARTICLES DIARY</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="<%=request.getContextPath()%>/insert.html">Add</a></li>
      <li><a href="<%=request.getContextPath()%>/add.html">List</a></li>
      <li><a href="<%=request.getContextPath()%>/setting.html">Settings</a></li>
      <li><a href="<%=request.getContextPath()%>/search.html">Search</a></li>
      <li><a href="<%=request.getContextPath()%>/logout.html">Logout</a></li>	
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="<%=request.getContextPath()%>/logout.html"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
 --%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="#">Articles Diary</a>
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/insert.html">Add</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/add.html">List</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/setting.html">Settings</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/search.html">Search</a>
    </li>
    <li class="nav-item">
    <a class="nav-link" style="margin-left:700px;" href="<%=request.getContextPath()%>/logout.html">Logout</a>
    </li>
  </ul>
</nav>
</body>
</html>
