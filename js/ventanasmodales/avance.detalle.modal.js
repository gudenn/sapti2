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
			$('#container').on('click','a.avancedetalle',function (e) {
				e.preventDefault();
                                var idc=$(this).attr('id');
				// load the contact form using ajax
				$.get("avance.detalle.modal.php?idev="+idc, function(data){
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
                        $('#contact-container .contact-title').html('Cargando Detalles...');
			dialog.overlay.fadeIn(50, function () {
				dialog.container.fadeIn(50, function () {
					dialog.data.fadeIn(50, function () {
						$('#contact-container .contact-content').animate({
							height: h
						}, function () {
                                                         $('#contact-container .contact-title').html(title);
							$('#contact-container form').fadeIn(50, function () {
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
			$('#contact-container form').fadeOut(50);
			$('#contact-container .contact-content').animate({
				height: 40
			}, function () {
				dialog.data.fadeOut(50, function () {
					dialog.container.fadeOut(50, function () {
						dialog.overlay.fadeOut(50, function () {
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
				.fadeIn(50);
		}
	};

	contact.init();

});