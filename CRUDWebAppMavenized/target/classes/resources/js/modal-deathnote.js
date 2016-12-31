/*
Javascript file of the function realted to the modal experience.
This file contains functions and methods that can be used to generate a modal by clicking on it.
--------------------
How to Use it ?     |
--------------------
To use this plugin you need to create a  HTML template as the one that follows and indicating a nodeModal-identifier attribute.
This attribute should correspond to the specified modal to open:
- In the modal you have to give to the *id* value: id="identifier-{your number of nodeModal-identifier}"
- to close the modal you have to indicate the same number to the *id*: id="CloseIdentifier-{your number of nodeModal-identifier}"
- Also to close the modal DO NOT FORGET to indicate the same attribute number to: nodeModal-identifier
************************ TEMPLATE HTML TO USE***********************
<button type="button" name="button" nodeModal-identifier="1" onclick="openModalDialog(event);">
  Click here to open modal
</button>
<!-- The Modal Global-->
<div class="modal" id="identifier-1" nodeModal-identifier="1">
  <!-- Modal content -->
  <div class="modal-content">
    <span class="modal-closer" id="CloseIdentifier-1" nodeModal-identifier="1">&times;</span>
    <!-- Add content, arbitrary -->
    <p>Sample paragraph, this is truly not recommended</p>
  </div>
</div>
  ************************ END TEMPLATE **************************
******************************************************************************************************************************************
*/

/**
* openModalDialog(event)
*
* This method is used to open a simple modal in the project you need.
* @param event
*/
function openModalDialog(event) {
  var targetElement = event.target,
      targetElementIdentifier = targetElement.getAttribute("nodeModal-identifier"),
      modal = document.getElementById('identifier-' + targetElementIdentifier);

  modal.style.display ='block';

  document.getElementById('CloseIdentifier-' + targetElementIdentifier).onclick = function(event) {
    var tar = event.target,
        targetElId = targetElement.getAttribute("nodeModal-identifier"),
        modalToClose = document.getElementById('identifier-' + targetElId);

        closeModalDialog(modalToClose);
  };

}

/**
* closeModalDialog([HTMLElement div])
*
* This method will close the dialog open with the span triggered
* @param modal HTMLElement -> div
*/
function closeModalDialog(modal) {
  modal.style.display = 'none';
}