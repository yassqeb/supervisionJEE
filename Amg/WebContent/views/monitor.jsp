<head>
  <title>Status Monitor</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">


<script type="text/javascript">
console.clear();
var nodes = [
  { hostname: "Adowa", status: "OK", address: "192.168.0.24", icon: "plane" },
  { hostname: "Betty", status: "OK", address: "192.168.0.32", icon: "tasks" },
  { hostname: "Derelict", status: "OFFLINE", address: "192.168.0.48", icon: "globe" },
  { hostname: "Erebus", status: "OK", address: "192.168.0.64", icon: "upload" },
  { hostname: "K-014", status: "OK", address: "192.168.0.96", icon: "download" },
  { hostname: "Patna", status: "OFFLINE", address: "192.168.0.128", icon: "tasks" },
  { hostname: "Shinyo Maru", status: "OK", address: "192.168.0.160", icon: "phone" },
  { hostname: "Typhoon", status: "OK", address: "192.168.0.192", icon: "globe" }
];
var initialViews = [
  { title: "Dashboard", closed: false, content: function() {
    var nodelist = document.createElement("div");
    nodelist.classList.add("nodelist");
    for(each in nodes) {
      var node = document.createElement("div");
      node.classList.add("node");
      if(nodes[each].status !== "OK") { node.classList.add("fail"); }
      
      var icon = document.createElement("div");
      icon.classList.add("icon","glyphicon", "glyphicon-"+nodes[each].icon);
      node.appendChild(icon);
      
      var details = document.createElement("ul");
      details.classList.add("details");
      
      var host = document.createElement("li");
      host.innerHTML = "Hostname:";
      var hostLink = document.createElement("a");
      hostLink.classList.add("data");
      hostLink.innerHTML = nodes[each].hostname;
      hostLink.setAttribute("href", "#"+nodes[each].address);
      host.appendChild(hostLink);
      details.appendChild(host);
      
      var status = document.createElement("li");
      status.innerHTML = "Status:";
      var statusLine = document.createElement("div");
      statusLine.classList.add("data", "signal");
      statusLine.innerHTML = nodes[each].status;
      status.appendChild(statusLine);
      details.appendChild(status);
      
      var address = document.createElement("li");
      address.innerHTML = "Address:";
      var ip = document.createElement("div");
      ip.classList.add("data");
      ip.innerHTML = nodes[each].address;
      address.appendChild(ip);
      details.appendChild(address);
      
      node.appendChild(details);
      nodelist.appendChild(node);
    }
    return nodelist;
  } },
  { title: "Console", closed: false, content: function() {
    var content = document.createElement("div");
    content.classList.add("console");
    content.innerHTML = "admin@wlndytn:~$ uname -srnmo\n\
Linux Weyland 2.6.32-042stab062.2 x86_64 GNU/Linux\n\
admin@wlndytn:~$ _";
    return content;
  } },
  { title: "CPU Load", closed: true },
  { title: "Memory", closed: true },
  { title: "DNS", closed: true },
  { title: "Graphs & Logs", closed: true },
];
var menuButton = document.getElementById("viewButton");
var menu = menuButton.parentNode;

function createMenu () {
  var target = document.querySelectorAll(".menu .items")[0];
  initialViews.map(function(e) {
    var btn = document.createElement("div");
    btn.innerHTML = e.title;
    btn.setAttribute("id", "btn-" + e.title.split(" ")[0].toLowerCase());
    btn.classList.add("button");
    if(!e.closed) {
      btn.classList.add("selected");
    }
    createView(e);
    target.appendChild(btn);
  });
}
function createView (v) {
  var content = document.querySelectorAll(".content")[0];
  var view = document.createElement("div");
  view.setAttribute("id", v.title.split(" ")[0].toLowerCase() );
  view.classList.add("view");
  if(v.closed) { view.classList.add("closed"); }
  var viewTitle = document.createElement("h2");
  viewTitle.innerHTML = v.title;
  view.appendChild(viewTitle);
  if(typeof v.content == "function") {
    view.appendChild(v.content());
  }
  content.appendChild(view);
}

createMenu();

function createConsole () {
  var term = document.createElement("div");
  term.classList.add("console");
  term.innerHTML = "admin@wlndytn:~$ uname -srnmo\
Linux Weyland 2.6.32-042stab062.2 x86_64 GNU/Linux\
admin@wlndytn:~$ _";
  return term;
}

menu.addEventListener("click", function(evt) {
  if(evt.target == menuButton) {
    menu.classList.toggle("closed");
    return false;
  }
  var e = evt.target;
  e.classList.toggle("selected");
  var t = document.querySelector("#" + e.id.split("btn-")[1]);
  t.classList.toggle("closed");
});

var views = document.querySelectorAll(".view h2");
[].forEach.call(views, function (el) {
  el.addEventListener("click", function(evt) {
    el.parentNode.classList.toggle("closed");
    var button = document.querySelector("#btn-" + el.parentNode.id);
    button.classList.toggle("selected");
  }, false);
});





</script>










</head>
<body>
  <div class="content">
    <div class="header">
      <a href="#">WlndYtn&reg;</a>
      <a href="#">node management</a>
      <div href="#" class="current">Status monitor</div>
    </div>
    <div class="menu closed"><a id="viewButton" href="#">Views</a><div class="items"></div></div>  
    <div class="footer"><a href="mailto:thykka+nospam@gmail.com">Moses Holmström &copy; 2014</a></div>
  </div>
</body>