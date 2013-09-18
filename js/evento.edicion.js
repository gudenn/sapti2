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
			$('#content a.eventoedit').live('click', function (e) {
				e.preventDefault();
                                var idc=$(this).attr('id');
				// load the contact form using ajax
				$.get("evento.edicion.php?idev="+idc, function(data){
					// create a modal dialog with the data
                                        
					$(data).modal({
						closeHTML: "<a href='#' title='Close' class='modal-close'>x</a>",
						position: ["15%",],
						overlayId: 'contact-overlay',
						containerId: 'contact-container',
						onOpen: contact.open,
						onShow: contact.show,
						onClose: contact.close
					});
				});
			});
		},
                open: function (dialog) {
			// dynamically determine height
			var h = 280;
			var title = $('#contact-container .contact-title').html();
			$('#contact-container .contact-title').html('Cargando Eventos...');
			dialog.overlay.fadeIn(200, function () {
				dialog.container.fadeIn(200, function () {
					dialog.data.fadeIn(200, function () {
						$('#contact-container .contact-content').animate({
							height: h
						}, function () {
							$('#contact-container .contact-title').html(title);
							$('#contact-container form').fadeIn(200, function () {
								$('#contact-container #contact-title').focus();
							});
						});
					});
				});
			});
		},
		show: function (dialog) {
			$('#contact-container .contact-send').click(function (e) {
				e.preventDefault();
				// validate form
				if (contact.validate()) {
					var msg = $('#contact-container .contact-message');
					msg.fadeOut(function () {
						msg.removeClass('contact-error').empty();
					});
					$('#contact-container .contact-title').html('Grabando...');
					$('#contact-container form').fadeOut(200);
					$('#contact-container .contact-content').animate({
						height: '80px'
					}, function () {
						$('#contact-container .contact-loading').fadeIn(200, function () {
							$.ajax({
								url: 'evento.edicion.php',
								data: $('#contact-container form').serialize() + '&action=send',
								type: 'post',
								cache: false,
								dataType: 'html',
								success: function (data) {
									$('#contact-container .contact-loading').fadeOut(200, function () {
										$('#contact-container .contact-titulo').html('Disculpas');
										msg.html(data).fadeIn(200);
									});
								},
								error: contact.error
							});
						});
					});
				}
				else {
					if ($('#contact-container .contact-message:visible').length > 0) {
						var msg = $('#contact-container .contact-message div');
						msg.fadeOut(200, function () {
							msg.empty();
							contact.showError();
							msg.fadeIn(200);
						});
					}
					else {
						$('#contact-container .contact-message').animate({
							height: '30px'
						}, contact.showError);
					}
					
				}
			});
		},
		close: function (dialog) {
			$('#contact-container .contact-message').fadeOut();
			$('#contact-container .contact-title').html('Gracias...');
			$('#contact-container form').fadeOut(200);
			$('#contact-container .contact-content').animate({
				height: 40
			}, function () {
				dialog.data.fadeOut(200, function () {
					dialog.container.fadeOut(200, function () {
						dialog.overlay.fadeOut(200, function () {
							$.modal.close(window.location.reload());
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
				.fadeIn(200);
		}
	};

	contact.init();

});