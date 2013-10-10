/*
 * SimpleModal Contact Form
 * http://simplemodal.com
 *
 * Copyright (c) 2013 Eric Martin - http://ericmmartin.com
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 */
jQuery(function ($) {
    
	var contact = {
		message: null,
		init: function () {
			$('#container').on('click','a.historial',function (e) {
				e.preventDefault();
                                var idc=$(this).attr('id');
				// load the contact form using ajax
				$.get("historial.notas.php?idev="+idc, function(data){
					// create a modal dialog with the data
                                        
					$(data).modal({
						closeHTML: "<a href='#' title='Close' class='modal-close'>Cerrar</a>",
						position: ["15%"],
						overlayId: 'contact-overlay',
						containerId: 'contact-container',
						onOpen: contact.open,
						onClose: contact.close
					});
				});
			});
		},
                open: function (dialog) {
			// dynamically determine height
			var h = 410;
                        var title = $('#contact-container .contact-title').html();
                        $('#contact-container .contact-title').html('Cargando Historial...');
			dialog.overlay.fadeIn(100, function () {
				dialog.container.fadeIn(100, function () {
					dialog.data.fadeIn(100, function () {
						$('#contact-container .contact-content').animate({
							height: h
						}, function () {
                                                         $('#contact-container .contact-title').html(title);
							$('#contact-container form').fadeIn(100, function () {
								$('#contact-container #contact-title').focus();
							});
						});
					});
				});
			});
		},
		close: function (dialog) {
			$('#contact-container .contact-message').fadeOut();
			$('#contact-container .contact-title').html('Gracias...');
			$('#contact-container form').fadeOut(100);
			$('#contact-container .contact-content').animate({
				height: 40
			}, function () {
				dialog.data.fadeOut(100, function () {
					dialog.container.fadeOut(100, function () {
						dialog.overlay.fadeOut(100, function () {
							$.modal.close();
						});
					});
				});
			});
		},
		error: function (xhr) {
			alert(xhr.statusText);
		},
		validate: function () {
				return true;
			
		},
		showError: function () {
			$('#contact-container .contact-message')
				.html($('<div class="contact-error"></div>').append(contact.message))
				.fadeIn(100);
		}
	};

	contact.init();

});