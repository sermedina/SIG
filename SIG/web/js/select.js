$(document).ready(function()
{
	var msg = "";
	var elements = document.getElementsByTagName("INPUT");

	for (var i = 0; i < elements.length; i++)
	{
		elements[i].oninvalid = function(e)
		{
			if (!e.target.validity.valid)
			{
				switch(e.target.id)
				{
				case 'pas': 
					e.target.setCustomValidity("La contrasena no puede estar vacia");
					break;
				case 'usr': 
					e.target.setCustomValidity("El usuario no puede estar vacio");
					break;
				default:
					e.target.setCustomValidity("");
					break;
				}
			}
		};
	
		elements[i].oninput = function(e) { e.target.setCustomValidity(msg); };
	} 
});