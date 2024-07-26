document.getElementById("paymentForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent form submission
  
    // Simulate processing (replace with your actual payment processing logic)
    setTimeout(function() {
      openSuccessPopup();
    }, 500); // Show the success popup after 1 second
  });
  
  function openSuccessPopup() {
    var popup = document.getElementById("successPopup");
    popup.style.display = "block";
  }
  