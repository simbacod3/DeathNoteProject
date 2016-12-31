/*
Javascript file of the function realted to the menu experience.
This file contains functions and methods that can be used to generate a menu by clicking on it.

--------------------
How to Use it ?     |
--------------------


************************ TEMPLATE HTML TO USE***********************
<span style="font-size:30px;cursor:pointer" onclick="openMenuNavigation()">&#9776;</span>


<div id="main">
  <div id="mySideBarnav" class="sideBarNav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeMenuNavigation()">&times;</a>

    <!-- add arbitrary your content here -->
    <a href="#">Admin</a>
    <a href="#">Check a date</a>
    <a href="#">About us</a>
    <a href="#">Report bug</a>
  </div>
</div>

  ************************ END TEMPLATE **************************
******************************************************************************************************************************************
*/

/**
*
*
*/
function openMenuNavigation() {
    document.getElementById("mySideBarnav").style.width = "250px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

/**
*
*
*/
function closeMenuNavigation() {
    document.getElementById("mySideBarnav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
    document.body.style.backgroundColor = "white";
}
