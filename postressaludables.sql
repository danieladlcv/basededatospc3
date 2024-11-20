-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2024 a las 10:59:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `postressaludables`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarPreferencia` (IN `p_id` INT, IN `p_tipopostre` VARCHAR(100), IN `p_nivelactividad` VARCHAR(50), IN `p_comidasaldia` INT, IN `p_prefiereOrganico` BOOLEAN, IN `p_bajoEnAzucar` BOOLEAN, IN `p_altoEnProteina` BOOLEAN)   BEGIN
    UPDATE preferenciasAlimenticias
    SET 
        tipopostre = p_tipopostre,
        nivelactividad = p_nivelactividad,
        comidasaldia = p_comidasaldia,
        prefiereOrganico = p_prefiereOrganico,
        bajoEnAzucar = p_bajoEnAzucar,
        altoEnProteina = p_altoEnProteina
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarRecetaPostres` (IN `p_id` INT, IN `p_nombre` VARCHAR(255), IN `p_tipopostre` VARCHAR(100), IN `p_ingredientes` TEXT, IN `p_descripcionReceta` TEXT)   BEGIN
    UPDATE RecetasPostres
    SET nombre = p_nombre,
        ingredientes = p_ingredientes,
        tipopostre = p_tipopostre,
        descripcionReceta = p_descripcionReceta
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarRestriccion` (IN `p_id` INT, IN `p_alergias` VARCHAR(255), IN `p_gluten` BOOLEAN, IN `p_lactosa` BOOLEAN, IN `p_azucar` BOOLEAN, IN `p_vegano` BOOLEAN, IN `p_citrico` BOOLEAN, IN `p_bajoEnGrasa` BOOLEAN)   BEGIN
    UPDATE RestriccionesAlimentarias
    SET
        alergias = p_alergias,
        gluten = p_gluten,
        lactosa = p_lactosa,
        azucar = p_azucar,
        vegano = p_vegano,
        citrico = p_citrico,
        bajoEnGrasa = p_bajoEnGrasa
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarPreferencia` (IN `p_tipopostre` VARCHAR(100), IN `p_nivelactividad` VARCHAR(100), IN `p_comidasaldia` INT, IN `p_prefiereOrganico` BOOLEAN, IN `p_bajoEnAzucar` BOOLEAN, IN `p_altoEnProteina` BOOLEAN)   BEGIN
    INSERT INTO preferenciasAlimenticias (tipopostre, nivelactividad, comidasaldia, prefiereOrganico, bajoEnAzucar, altoEnProteina)
    VALUES (p_tipopostre, p_nivelactividad, p_comidasaldia, p_prefiereOrganico, p_bajoEnAzucar, p_altoEnProteina);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarRecetaPostres` (IN `p_id` INT(100), IN `p_nombre` VARCHAR(100), IN `p_tipopostre` VARCHAR(100), IN `p_ingredientes` TEXT, IN `p_descripcionReceta` TEXT)   BEGIN
    INSERT INTO recetasPostres (id, nombre,  tipopostre, ingredientes, descripcionReceta)
    VALUES (p_id, p_nombre,  p_tipopostre, p_ingredientes,  p_descripcionReceta);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarRestriccion` (IN `p_id` INT, IN `p_alergias` VARCHAR(100), IN `p_gluten` BOOLEAN, IN `p_lactosa` BOOLEAN, IN `p_azucar` BOOLEAN, IN `p_vegano` BOOLEAN, IN `p_citrico` BOOLEAN, IN `p_bajoEnGrasa` BOOLEAN)   BEGIN
    INSERT INTO restriccionalimentaria (id, alergias, gluten, lactosa, azucar, vegano, citrico, bajoEnGrasa)
    VALUES (p_id, p_Alergias, p_gluten, p_lactosa, p_azucar, p_vegano, p_citrico, p_bajoEnGrasa);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarusuario` (IN `id` INT, IN `nombre` VARCHAR(100), IN `email` VARCHAR(100), IN `telefono` VARCHAR(9), IN `password` VARCHAR(100))   BEGIN
     -- SET NOCOUNT ON;

    -- Verificar si el saldo es suficiente
    IF EXISTS (SELECT 1 FROM usuario WHERE email = @email) THEN
        SELECT 'El email ya está registrado' AS mensaje;
        
    ELSE
        INSERT INTO usuario (id, nombre, email,telefono, password) VALUES 
        (id, nombre, email,telefono, password);       
        SELECT 'email insertado ' AS mensaje;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BorrarRecetaPostres` (IN `p_id` INT)   BEGIN
    DELETE FROM RecetasPostres WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarusuarios` (IN `p_id` INT)   BEGIN
    DELETE FROM usuario
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarPreferencia` (IN `p_id` INT)   BEGIN
    DELETE FROM preferenciasAlimenticias
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarRestriccion` (IN `p_id` INT)   BEGIN
    DELETE FROM RestriccionesAlimentarias
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarPreferencia` ()   BEGIN
    SELECT *
    FROM preferenciasalimenticias;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarrecetapostres` ()   BEGIN
    SELECT *
    FROM recetaspostres;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarRestriccion` ()   BEGIN
    SELECT *
    FROM restriccionalimentaria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarunPreferencia` (IN `p_id` INT)   BEGIN
    SELECT *
    FROM preferenciasalimenticias
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarunRecetaPostres` (IN `p_id` INT)   BEGIN
    SELECT *
    FROM  recetaspostres
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarunRestriccion` (IN `p_id` INT)   BEGIN
    SELECT *
    FROM restriccionalimentaria
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarunusuario` (IN `p_id` INT)   BEGIN
    SELECT *
    FROM usuario
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarusuarios` ()   BEGIN
    SELECT *
    FROM usuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateusuarios` (IN `p_nombre` VARCHAR(600), IN `p_email` VARCHAR(600), IN `p_telefono` VARCHAR(9), IN `p_password` VARCHAR(600))   BEGIN
    UPDATE
        usuario
    SET
        nombre = p_nombre,
        email = p_email,
        telefono= p_telefono,
        password = p_password
    WHERE
        email = p_email ;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferenciasalimenticias`
--

CREATE TABLE `preferenciasalimenticias` (
  `id` int(11) NOT NULL,
  `tipopostre` varchar(100) DEFAULT NULL,
  `nivelactividad` varchar(50) DEFAULT NULL,
  `comidasaldia` int(11) DEFAULT NULL,
  `prefiereOrganico` tinyint(1) DEFAULT NULL,
  `bajoEnAzucar` tinyint(1) DEFAULT NULL,
  `altoEnProteina` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetaspostres`
--

CREATE TABLE `recetaspostres` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipopostre` varchar(100) DEFAULT NULL,
  `ingredientes` text NOT NULL,
  `descripcionReceta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recetaspostres`
--

INSERT INTO `recetaspostres` (`id`, `nombre`, `tipopostre`, `ingredientes`, `descripcionReceta`) VALUES
(3, 'Vainilla', 'Helado', 'Agua, leche, azucar, lúcuma, harina', 'Es bueno para disminuir calorías'),
(4, 'Helado de Fresa con miel ', 'Helado', 'Fresas,leche,azucar', 'Es buena para la salud');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restriccionalimentaria`
--

CREATE TABLE `restriccionalimentaria` (
  `id` int(11) NOT NULL,
  `alergias` tinyint(1) DEFAULT NULL,
  `gluten` tinyint(1) DEFAULT NULL,
  `lactosa` tinyint(1) DEFAULT NULL,
  `azucar` tinyint(1) DEFAULT NULL,
  `vegano` tinyint(1) DEFAULT NULL,
  `citrico` tinyint(1) DEFAULT NULL,
  `bajoengrasa` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `restriccionalimentaria`
--

INSERT INTO `restriccionalimentaria` (`id`, `alergias`, `gluten`, `lactosa`, `azucar`, `vegano`, `citrico`, `bajoengrasa`) VALUES
(6, 0, 1, 0, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `email`, `telefono`, `password`) VALUES
(0, 'Mario', 'Mario2025@gmail.com', '', 'Mario2'),
(2, 'Juan Pérez', 'juan@example.com', '', '123456789'),
(3, 'Juancito2025', 'juancito36@gmail.com', '', 'jua30'),
(7, 'A', '20245@gmail.com', '', 'uec'),
(8, 'NC', '20285@gmail.com', '', 'guc'),
(9, 'ft', '202895@gmail.com', '', 'rct'),
(11, 'erer', '207795@gmail.com', '', 'tcrnin'),
(17, 'Pauli', '1389@gmail.com', '', 'nnior'),
(19, '8mgfb', '276g95@gmail.com', '', 'mo3ws5'),
(20, '8mgfb', '276g995@gmail.com', '', 'mo3ws5'),
(23, '8mgfb', '276g9hg5@gmail.com', '', 'mo3ws5'),
(27, '8mggbfb', '2786g909hg5@gmail.com', '', 'mo3jhwxfs5'),
(29, '8mgigbfb', '2784re09hg5@gmail.com', '', 'mojtfcfs5'),
(30, 'Karmen', 'Karmen2025@gmail.com', '', 'karm'),
(37, 'Dalia', 'Dalia2025@gmail.com', '', 'Da09'),
(38, 'Lucesita338', '3Lucecist202438@gmail.com', '', 'Luce338'),
(39, 'Lucesita339', '3Lucecist20243839@gmail.com', '', 'Luce339'),
(46, 'Dolores', 'Dolores2025@gmail.com', '', 'flores'),
(48, 'Rosita', 'Rosita2025@gmail.com', '', 'rosa'),
(49, 'Yami', 'Yami.Caituiro@gmail.com', '345453652', 'yami');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `preferenciasalimenticias`
--
ALTER TABLE `preferenciasalimenticias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recetaspostres`
--
ALTER TABLE `recetaspostres`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `restriccionalimentaria`
--
ALTER TABLE `restriccionalimentaria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
