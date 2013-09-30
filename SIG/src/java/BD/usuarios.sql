-- Coordinadores
INSERT INTO USUARIO (login, email, password, nombre, privilegios) VALUES
('0100', 'coord-el@usb.ve', '0', 'Coordinación Ing. Eléctrica', 8),
('0200', 'coord-mc@usb.ve', '0', 'Coordinación Ing. Mecánica', 8),
('0300', 'coord-iq@usb.ve', '0', 'Coordinación Ing. Química', 8),
('0400', 'coord-qm@usb.ve', '0', 'Coordinación Lic. Química', 8),
('0500', 'coord-ma@usb.ve', '0', 'Coordinación Lic. Matemática', 8),
('0600', 'coord-electronica@usb.ve', '0', 'Coordinación Ing. Electrónica', 8),
('0700', 'coord-arq@usb.ve', '0', 'Coordinación Arquitectura', 8),
('0800', 'coord-comp@usb.ve', '0', 'Coordinación Ing. Computación', 8),
('1000', 'coord-fis@usb.ve', '0', 'Coordinación Lic. Física', 8),
('1100', 'coord-urb@usb.ve', '0', 'Coordinación Est. Urbanos', 8),
('1200', 'coord-geo@usb.ve', '0', 'Coordinación Ing. Geofísica', 8),
('1500', 'coord-mt@usb.ve', '0', 'Coordinación Ing. Materiales', 8),
('1700', 'coord-pro@usb.ve', '0', 'Coordinación Ing. Produción', 8),
('-', 'cctmma@usb.ve', '0', 'Coordinación Ing. Mantenimiento', 8),
('--', 'coord-it@usb.ve', '0', 'Coordinación Ing. Telecomunicaciones', 8),
('1900', 'coord-bio@usb.ve', '0', 'Coordinación Lic. Biología', 8),
('3000', 'coord-thnul@usb.ve', '0', 'Coordinación Turismo, Hotelería y Hospitalidad', 8),
('3200', 'coord-cext@usb.ve', '0', 'Coordinación Comercio Exterior', 8);

INSERT INTO USUARIO (login, email, password, nombre, privilegios) VALUES
('admin', 'equivalencias@usb.ve', '0', 'Administrador', 2147483647);