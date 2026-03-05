-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-03-2026 a las 19:17:18
-- Versión del servidor: 8.4.7
-- Versión de PHP: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dnd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alineamientos`
--

DROP TABLE IF EXISTS `alineamientos`;
CREATE TABLE IF NOT EXISTS `alineamientos` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `alineamientos`
--

INSERT INTO `alineamientos` (`id`, `nombre`) VALUES
(1, 'Legal Bueno'),
(2, 'Neutral Bueno'),
(3, 'Caótico Bueno'),
(4, 'Legal Neutral'),
(5, 'Neutral'),
(6, 'Caótico Neutral'),
(7, 'Legal Malvado'),
(8, 'Neutral Malvado'),
(9, 'Caótico Malvado'),
(10, 'Sin alineamiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atributos`
--

DROP TABLE IF EXISTS `atributos`;
CREATE TABLE IF NOT EXISTS `atributos` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `atributos`
--

INSERT INTO `atributos` (`id`, `nombre`) VALUES
(1, 'Fuerza'),
(2, 'Destreza'),
(3, 'Constitución'),
(4, 'Inteligencia'),
(5, 'Sabiduría'),
(6, 'Carisma');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

DROP TABLE IF EXISTS `clases`;
CREATE TABLE IF NOT EXISTS `clases` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dado_golpe` int NOT NULL,
  `tipo_lanzador` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `color_primario` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '#ffffff',
  `color_secundario` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '#ffffff',
  `icono` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '⚔️',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ;

--
-- Volcado de datos para la tabla `clases`
--

INSERT INTO `clases` (`id`, `nombre`, `dado_golpe`, `tipo_lanzador`, `descripcion`, `color_primario`, `color_secundario`, `icono`) VALUES
(1, 'Paladín', 10, 'half', 'Los paladines son guerreros sagrados que han jurado servir a una causa santa. Combinan el combate marcial con el poder divino, actuando como guardianes contra las fuerzas de la oscuridad.', '#FFD700', '#B8860B', '🛡️');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_hechizos`
--

DROP TABLE IF EXISTS `clase_hechizos`;
CREATE TABLE IF NOT EXISTS `clase_hechizos` (
  `clase_id` int NOT NULL,
  `hechizo_id` int NOT NULL,
  PRIMARY KEY (`clase_id`,`hechizo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_rasgos`
--

DROP TABLE IF EXISTS `clase_rasgos`;
CREATE TABLE IF NOT EXISTS `clase_rasgos` (
  `clase_id` int NOT NULL,
  `rasgo_id` int NOT NULL,
  `nivel_requerido` int DEFAULT NULL,
  PRIMARY KEY (`clase_id`,`rasgo_id`),
  KEY `fk_clase_rasgo` (`rasgo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clase_rasgos`
--

INSERT INTO `clase_rasgos` (`clase_id`, `rasgo_id`, `nivel_requerido`) VALUES
(1, 11, 1),
(1, 10, 1),
(1, 12, 2),
(1, 13, 2),
(1, 14, 2),
(1, 15, 3),
(1, 16, 3),
(1, 17, 4),
(1, 18, 5),
(1, 19, 6),
(1, 20, 10),
(1, 21, 11),
(1, 22, 14),
(1, 23, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competencias`
--

DROP TABLE IF EXISTS `competencias`;
CREATE TABLE IF NOT EXISTS `competencias` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dotes`
--

DROP TABLE IF EXISTS `dotes`;
CREATE TABLE IF NOT EXISTS `dotes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuelas_magia`
--

DROP TABLE IF EXISTS `escuelas_magia`;
CREATE TABLE IF NOT EXISTS `escuelas_magia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `escuelas_magia`
--

INSERT INTO `escuelas_magia` (`id`, `nombre`) VALUES
(1, 'Abjuración'),
(2, 'Conjuración'),
(3, 'Adivinación'),
(4, 'Encantamiento'),
(5, 'Evocación'),
(6, 'Ilusión'),
(7, 'Nigromancia'),
(8, 'Transmutación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidades`
--

DROP TABLE IF EXISTS `habilidades`;
CREATE TABLE IF NOT EXISTS `habilidades` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `atributo_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `habilidades`
--

INSERT INTO `habilidades` (`id`, `nombre`, `atributo_id`) VALUES
(1, 'Acrobacias', NULL),
(2, 'Arcanos', NULL),
(3, 'Atletismo', NULL),
(4, 'Engaño', NULL),
(5, 'Historia', NULL),
(6, 'Interpretación', NULL),
(7, 'Intimidación', NULL),
(8, 'Investigación', NULL),
(9, 'Juego de Manos', NULL),
(10, 'Medicina', NULL),
(11, 'Naturaleza', NULL),
(12, 'Percepción', NULL),
(13, 'Perspicacia', NULL),
(14, 'Persuasión', NULL),
(15, 'Religión', NULL),
(16, 'Sigilo', NULL),
(17, 'Supervivencia', NULL),
(18, 'Trato con Animales', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hechizos`
--

DROP TABLE IF EXISTS `hechizos`;
CREATE TABLE IF NOT EXISTS `hechizos` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivel` int NOT NULL,
  `tiempo_lanzamiento` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duracion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `concentracion` tinyint(1) DEFAULT '0',
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `escuela_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_hechizo_escuela` (`escuela_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `hechizos`
--

INSERT INTO `hechizos` (`id`, `nombre`, `nivel`, `tiempo_lanzamiento`, `duracion`, `concentracion`, `descripcion`, `escuela_id`) VALUES
(1, 'Bendición', 1, '1 acción', 'Concentración, hasta 1 minuto', 1, 'Bendices hasta tres criaturas de tu elección dentro del alcance. Cuando una criatura objetivo hace una tirada de ataque o una tirada de salvación antes de que el conjuro termine, el objetivo puede tirar un d4 y añadir el número tirado a la tirada de ataque o tirada de salvación.', 4),
(2, 'Curar Heridas', 1, '1 acción', 'Instantánea', 0, 'Una criatura que toques recupera un número de puntos de golpe igual a 1d8 + tu modificador de característica de lanzamiento de conjuros.', 5),
(3, 'Protección contra el Mal y el Bien', 1, '1 acción', 'Concentración, hasta 10 minutos', 1, 'Hasta que el conjuro termine, una criatura voluntaria que toques está protegida contra ciertos tipos de criaturas: aberraciones, celestiales, elementales, feéricos, infernales y no-muertos.', 1),
(4, 'Santuario', 1, '1 acción adicional', '1 minuto', 0, 'Proteges a una criatura dentro del alcance contra los ataques. Cualquier criatura que intente atacar a la criatura protegida debe superar una tirada de salvación de Sabiduría o elegir un nuevo objetivo.', 1),
(5, 'Detectar el Mal y el Bien', 1, '1 acción', 'Concentración, hasta 10 minutos', 1, 'Durante la duración, sabes si hay una aberración, celestial, elemental, feérico, infernal o no-muerto a 30 pies o menos de ti.', 3),
(6, 'Restauración Menor', 2, '1 acción', 'Instantánea', 0, 'Tocas a una criatura y terminas una enfermedad o una condición que la afecte. La condición puede ser cegado, ensordecido, paralizado o envenenado.', 1),
(7, 'Zona de la Verdad', 2, '1 acción', '10 minutos', 0, 'Creas una zona mágica que protege contra el engaño en una esfera de 15 pies de radio centrada en un punto de tu elección dentro del alcance. Las criaturas no pueden decir mentiras deliberadas mientras estén dentro del área.', 4),
(8, 'Arma Espiritual', 2, '1 acción adicional', '1 minuto', 0, 'Creas un arma espectral flotante dentro del alcance que dura durante la duración o hasta que lances este conjuro de nuevo. Puedes usar una acción adicional para mover el arma hasta 20 pies y repetir el ataque.', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

DROP TABLE IF EXISTS `idiomas`;
CREATE TABLE IF NOT EXISTS `idiomas` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`id`, `nombre`) VALUES
(1, 'Común'),
(2, 'Élfico'),
(3, 'Enano'),
(4, 'Gigante'),
(5, 'Dracónico'),
(6, 'Infernal'),
(7, 'Celestial'),
(8, 'Orco'),
(9, 'Abisal'),
(10, 'Silvano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_personaje`
--

DROP TABLE IF EXISTS `inventario_personaje`;
CREATE TABLE IF NOT EXISTS `inventario_personaje` (
  `personaje_id` int NOT NULL,
  `objeto_id` int NOT NULL,
  `cantidad` int DEFAULT '1',
  `equipado` tinyint(1) DEFAULT '0',
  `sintonizado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`personaje_id`,`objeto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monstruos`
--

DROP TABLE IF EXISTS `monstruos`;
CREATE TABLE IF NOT EXISTS `monstruos` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clase_armadura` int DEFAULT NULL,
  `puntos_golpe` int DEFAULT NULL,
  `velocidad` int DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `desafio` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bonificador_competencia` int DEFAULT NULL,
  `percepcion_pasiva` int DEFAULT NULL,
  `tipo_id` int NOT NULL,
  `tamano_id` int NOT NULL,
  `alineamiento_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_monstruo_tipo` (`tipo_id`),
  KEY `fk_monstruo_tamano` (`tamano_id`),
  KEY `fk_monstruo_alineamiento` (`alineamiento_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `monstruos`
--

INSERT INTO `monstruos` (`id`, `nombre`, `clase_armadura`, `puntos_golpe`, `velocidad`, `descripcion`, `desafio`, `bonificador_competencia`, `percepcion_pasiva`, `tipo_id`, `tamano_id`, `alineamiento_id`) VALUES
(2, 'Lobo', 13, 11, 40, 'Depredador social que caza en manada y utiliza tácticas coordinadas para derribar a sus presas.', '1/4', 2, 13, 1, 3, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monstruo_acciones`
--

DROP TABLE IF EXISTS `monstruo_acciones`;
CREATE TABLE IF NOT EXISTS `monstruo_acciones` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `monstruo_id` int DEFAULT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `tipo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `monstruo_acciones`
--

INSERT INTO `monstruo_acciones` (`id`, `monstruo_id`, `nombre`, `descripcion`, `tipo`) VALUES
(1, 2, 'Mordisco', 'Ataque de arma cuerpo a cuerpo: +4 al ataque, alcance 5 pies, un objetivo. Impacto: 7 (2d4 + 2) de daño perforante. Si el objetivo es una criatura, debe superar una tirada de salvación de Fuerza CD 13 o quedará derribada.', 'accion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monstruo_atributos`
--

DROP TABLE IF EXISTS `monstruo_atributos`;
CREATE TABLE IF NOT EXISTS `monstruo_atributos` (
  `monstruo_id` int NOT NULL,
  `atributo_id` int NOT NULL,
  `valor` int NOT NULL,
  PRIMARY KEY (`monstruo_id`,`atributo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `monstruo_atributos`
--

INSERT INTO `monstruo_atributos` (`monstruo_id`, `atributo_id`, `valor`) VALUES
(2, 1, 12),
(2, 2, 15),
(2, 3, 12),
(2, 4, 3),
(2, 5, 12),
(2, 6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monstruo_habilidades`
--

DROP TABLE IF EXISTS `monstruo_habilidades`;
CREATE TABLE IF NOT EXISTS `monstruo_habilidades` (
  `monstruo_id` int NOT NULL,
  `habilidad_id` int NOT NULL,
  `modificador` int NOT NULL,
  PRIMARY KEY (`monstruo_id`,`habilidad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `monstruo_habilidades`
--

INSERT INTO `monstruo_habilidades` (`monstruo_id`, `habilidad_id`, `modificador`) VALUES
(2, 12, 3),
(2, 16, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monstruo_rasgos`
--

DROP TABLE IF EXISTS `monstruo_rasgos`;
CREATE TABLE IF NOT EXISTS `monstruo_rasgos` (
  `monstruo_id` int NOT NULL,
  `rasgo_id` int NOT NULL,
  PRIMARY KEY (`monstruo_id`,`rasgo_id`),
  KEY `fk_monstruo_rasgo` (`rasgo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `monstruo_rasgos`
--

INSERT INTO `monstruo_rasgos` (`monstruo_id`, `rasgo_id`) VALUES
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monstruo_salvaciones`
--

DROP TABLE IF EXISTS `monstruo_salvaciones`;
CREATE TABLE IF NOT EXISTS `monstruo_salvaciones` (
  `monstruo_id` int NOT NULL,
  `atributo_id` int NOT NULL,
  `modificador` int NOT NULL,
  PRIMARY KEY (`monstruo_id`,`atributo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetos`
--

DROP TABLE IF EXISTS `objetos`;
CREATE TABLE IF NOT EXISTS `objetos` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `peso` decimal(6,2) DEFAULT NULL,
  `valor` int DEFAULT NULL,
  `daño` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_daño` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clase_armadura` int DEFAULT NULL,
  `requiere_sintonizacion` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

DROP TABLE IF EXISTS `personajes`;
CREATE TABLE IF NOT EXISTS `personajes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `raza_id` int DEFAULT NULL,
  `subraza_id` int DEFAULT NULL,
  `alineamiento_id` int DEFAULT NULL,
  `trasfondo_id` int DEFAULT NULL,
  `experiencia` int DEFAULT '0',
  `puntos_golpe_actual` int DEFAULT NULL,
  `notas` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje_atributos`
--

DROP TABLE IF EXISTS `personaje_atributos`;
CREATE TABLE IF NOT EXISTS `personaje_atributos` (
  `personaje_id` int NOT NULL,
  `atributo_id` int NOT NULL,
  `valor_base` int NOT NULL,
  `mejoras` int DEFAULT '0',
  PRIMARY KEY (`personaje_id`,`atributo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje_clases`
--

DROP TABLE IF EXISTS `personaje_clases`;
CREATE TABLE IF NOT EXISTS `personaje_clases` (
  `personaje_id` int NOT NULL,
  `clase_id` int NOT NULL,
  `subclase_id` int DEFAULT NULL,
  `nivel_clase` int NOT NULL,
  PRIMARY KEY (`personaje_id`,`clase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje_competencias`
--

DROP TABLE IF EXISTS `personaje_competencias`;
CREATE TABLE IF NOT EXISTS `personaje_competencias` (
  `personaje_id` int NOT NULL,
  `competencia_id` int NOT NULL,
  `fuente` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`personaje_id`,`competencia_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje_dotes`
--

DROP TABLE IF EXISTS `personaje_dotes`;
CREATE TABLE IF NOT EXISTS `personaje_dotes` (
  `personaje_id` int NOT NULL,
  `dote_id` int NOT NULL,
  PRIMARY KEY (`personaje_id`,`dote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje_hechizos`
--

DROP TABLE IF EXISTS `personaje_hechizos`;
CREATE TABLE IF NOT EXISTS `personaje_hechizos` (
  `personaje_id` int NOT NULL,
  `hechizo_id` int NOT NULL,
  `preparado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`personaje_id`,`hechizo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje_idiomas`
--

DROP TABLE IF EXISTS `personaje_idiomas`;
CREATE TABLE IF NOT EXISTS `personaje_idiomas` (
  `personaje_id` int NOT NULL,
  `idioma_id` int NOT NULL,
  PRIMARY KEY (`personaje_id`,`idioma_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje_niveles`
--

DROP TABLE IF EXISTS `personaje_niveles`;
CREATE TABLE IF NOT EXISTS `personaje_niveles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `personaje_id` int DEFAULT NULL,
  `clase_id` int DEFAULT NULL,
  `nivel_clase` int NOT NULL,
  `puntos_golpe_ganados` int NOT NULL,
  `fecha_subida` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgos`
--

DROP TABLE IF EXISTS `rasgos`;
CREATE TABLE IF NOT EXISTS `rasgos` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rasgos`
--

INSERT INTO `rasgos` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Oído y olfato agudo', 'El lobo tiene ventaja en tiradas de Sabiduría (Percepción) que dependan del oído y del olfato.'),
(2, 'Tácticas de manada', 'El lobo tiene ventaja en tiradas de ataque contra una criatura si al menos uno de los aliados del lobo está a 5 pies de la criatura y no está incapacitado.'),
(4, 'Visión en la Oscuridad', 'Acostumbrado a vivir bajo tierra, tienes visión superior en condiciones de oscuridad y luz tenue. Puedes ver en luz tenue a 60 pies como si fuera luz brillante, y en oscuridad como si fuera luz tenue.'),
(5, 'Resistencia Enana', 'Tienes ventaja en las tiradas de salvación contra veneno y posees resistencia contra el daño por veneno.'),
(6, 'Entrenamiento de Combate Enano', 'Eres competente con el hacha de batalla, hacha de mano, martillo arrojadiza y martillo de guerra.'),
(7, 'Competencia con Herramientas', 'Ganas competencia con una de las siguientes herramientas: herramientas de herrero, materiales de cervecería o herramientas de albañil.'),
(8, 'Afinidad con la Piedra', 'Cuando hagas una prueba de Inteligencia (Historia) relacionada con el origen de un trabajo hecho en piedra, se considera competente y añades el doble de tu bonificador de competencia.'),
(10, 'Sentido Divino', 'Como acción, puedes expandir tu consciencia para detectar fuerzas del mal y el bien. Conoces la localización de cualquier criatura celestial, demoniaco o muerto viviente en un rango de 60 pies. Puedes usarlo 1 + modificador de Carisma veces por descanso prolongado.'),
(11, 'Imposición de Manos', 'Tienes una reserva de poder curativo igual a tu nivel de paladín x 5. Como acción, puedes restaurar puntos de golpe o curar enfermedades y venenos gastando 5 puntos.'),
(12, 'Estilo de Combate', 'A nivel 2 adoptas un estilo de combate: Defensa (+1 CA con armadura), Duelista (+2 daño con arma a una mano), Lucha con Arma a Dos Manos (repetir 1s y 2s en daño) o Protección (desventaja a ataques contra aliados cercanos).'),
(13, 'Lanzamiento de Conjuros Paladín', 'A partir del nivel 2 puedes canalizar magia divina a través de la meditación. Usas Carisma como característica de lanzamiento. CD = 8 + bonificador de competencia + modificador de Carisma.'),
(14, 'Castigo Divino', 'Desde nivel 2, al golpear con un arma cuerpo a cuerpo puedes gastar un espacio de conjuro para infligir 2d8 de daño radiante adicional por espacio de nivel 1, más 1d8 por nivel superior. El daño se incrementa en 1d8 contra no-muertos e infernales.'),
(15, 'Salud Divina', 'A partir del nivel 3 la magia divina que fluye a través de ti te hace inmune a las enfermedades.'),
(16, 'Juramento Sagrado', 'Al nivel 3 realizas el juramento que te convierte en paladín para siempre. Escoge entre Juramento de Devoción, Juramento de los Ancestros o Juramento de Venganza.'),
(17, 'Mejora de Puntuación de Característica Paladín', 'Cuando alcanzas el nivel 4, y de nuevo en los niveles 8, 12, 16 y 19, puedes incrementar una puntuación de característica de tu elección en 2 puntos, o dos puntuaciones en 1 punto.'),
(18, 'Ataque Extra Paladín', 'Comenzando en el nivel 5 puedes atacar dos veces en lugar de una siempre que realices la acción de Atacar en tu turno.'),
(19, 'Aura de Protección', 'Desde el nivel 6, tú y las criaturas amistosas a 10 pies de ti ganáis tu modificador de Carisma (mínimo +1) a las tiradas de salvación. A nivel 18 el rango aumenta a 30 pies.'),
(20, 'Aura de Coraje', 'Desde el nivel 10, tú y las criaturas amistosas a 10 pies de ti no podéis ser asustados mientras estés consciente. A nivel 18 el rango aumenta a 30 pies.'),
(21, 'Castigo Divino Mejorado', 'En nivel 11, todos tus golpes con armas portan tu poder divino. Siempre que golpees con un arma cuerpo a cuerpo, la criatura recibe 1d8 de daño radiante extra.'),
(22, 'Toque Purificador', 'Desde nivel 14 puedes usar tu acción para finalizar un conjuro que te afecte a ti o a una criatura voluntaria. Usos igual a modificador de Carisma por descanso prolongado.'),
(23, 'Mejora de Auras', 'En el nivel 18 el rango de tus auras de Protección y Coraje aumenta a 30 pies.'),
(24, 'Arma Sagrada', 'Como una acción, puedes imbuir un arma que estés sujetando con energía positiva. Durante 1 minuto añades tu modificador de Carisma a las tiradas de ataque (mínimo +1). El arma emite luz brillante 20 pies y luz tenue 20 pies más.'),
(25, 'Expulsar al Profano', 'Como una acción, presentas tu símbolo sagrado y rezas una plegaria para controlar seres demoníacos y muertos vivientes usando tu Canalizar Divinidad.'),
(26, 'Aura de Devoción', 'Desde el nivel 7 tú y las criaturas amistosas a 10 pies de ti no podéis ser hechizados mientras estés consciente. A nivel 18 el rango aumenta a 30 pies.'),
(27, 'Pureza de Espíritu', 'Comenzando en el nivel 15 siempre estás bajo los efectos de un conjuro de protección contra el mal y el bien.'),
(28, 'Aura Sagrada', 'En el nivel 20 como una acción puedes emanar un aura de luz solar durante 1 minuto. Las criaturas enemigas en la luz brillante sufren 10 puntos de daño radiante al inicio de su turno.'),
(29, 'Ira de la Naturaleza', 'Puedes usar tu Canalizar Divinidad para invocar fuerzas primigenias que paralicen al objetivo. Enredaderas espectrales crecen y atrapan a una criatura que puedas ver a 10 pies de ti.'),
(30, 'Expulsar a los Infieles', 'Puedes usar tu Canalizar Divinidad para pronunciar antiguas palabras de poder que dañan a las criaturas fééricas y demoníacas al escucharlas.'),
(31, 'Aura de Custodia', 'Desde el nivel 7 la magia antigua te imbuye de una manera tan fuerte que posees resistencia sobrenatural. Tú y las criaturas amistosas a 10 pies de ti tenéis resistencia al daño de los hechizos.'),
(32, 'Centinela Imperecedero', 'Comenzando en el nivel 15, cuando eres reducido a 0 puntos de golpe puedes decidir ser reducido a 1 punto en su lugar. No puedes volver a usarlo hasta finalizar un descanso prolongado.'),
(33, 'Campeón Ancestral', 'En el nivel 20 puedes asumir la forma de una fuerza de la naturaleza ancestral tomando una apariencia de tu elección. Durante 1 minuto recuperas 10 PG al inicio de cada turno y puedes lanzar conjuros de paladín como acción adicional.'),
(34, 'Renunciar al Enemigo', 'Como una acción, presentas tu símbolo sagrado y entonas una plegaria de denuncia usando tu Canalizar Divinidad. Una criatura a 60 pies debe superar una tirada de salvación de Sabiduría o quedará asustada durante 1 minuto.'),
(35, 'Voto de Enemistad', 'Como acción adicional, realizas un voto de enemistad contra una criatura a 10 pies que puedas ver. Ganas ventaja en las tiradas de ataque contra esa criatura durante 1 minuto.'),
(36, 'Vengador Implacable', 'Desde el nivel 7, cuando golpeas a una criatura con un ataque de oportunidad, puedes moverte hasta la mitad de tu velocidad inmediatamente después del ataque.'),
(37, 'Alma de Venganza', 'Comenzando en el nivel 15, cuando una criatura bajo los efectos de tu Voto de Enemistad realiza un ataque, puedes usar tu reacción para realizar un ataque cuerpo a cuerpo contra esa criatura.'),
(38, 'Ángel Vengador', 'En el nivel 20 puedes asumir la forma de un vengador angelical durante 1 hora. De tu espalda surgen alas con velocidad de vuelo de 60 pies y emanas un aura amenazante en radio de 30 pies.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razas`
--

DROP TABLE IF EXISTS `razas`;
CREATE TABLE IF NOT EXISTS `razas` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `velocidad_base` int DEFAULT NULL,
  `tamano_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `fk_raza_tamano` (`tamano_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `razas`
--

INSERT INTO `razas` (`id`, `nombre`, `descripcion`, `velocidad_base`, `tamano_id`) VALUES
(2, 'Enano', 'Los enanos pueden llevar la vida del aventurero motivados por el deseo de recuperar el tesoro o territorio arrebatado a su clan, por un propósito específico o incluso por el deseo altruista de ayudar a los demás.', 25, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razas_bonificadores`
--

DROP TABLE IF EXISTS `razas_bonificadores`;
CREATE TABLE IF NOT EXISTS `razas_bonificadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `raza_id` int NOT NULL,
  `tipo` enum('atributo','pg_por_nivel','competencia_armadura','competencia_arma') COLLATE utf8mb4_unicode_ci NOT NULL,
  `atributo_id` int DEFAULT NULL,
  `valor` int DEFAULT '0',
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raza_id` (`raza_id`),
  KEY `atributo_id` (`atributo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `razas_bonificadores`
--

INSERT INTO `razas_bonificadores` (`id`, `raza_id`, `tipo`, `atributo_id`, `valor`, `descripcion`) VALUES
(1, 2, 'atributo', 3, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `raza_idiomas`
--

DROP TABLE IF EXISTS `raza_idiomas`;
CREATE TABLE IF NOT EXISTS `raza_idiomas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `raza_id` int NOT NULL,
  `idioma_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `raza_id` (`raza_id`),
  KEY `idioma_id` (`idioma_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `raza_idiomas`
--

INSERT INTO `raza_idiomas` (`id`, `raza_id`, `idioma_id`) VALUES
(1, 2, 1),
(2, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `raza_rasgos`
--

DROP TABLE IF EXISTS `raza_rasgos`;
CREATE TABLE IF NOT EXISTS `raza_rasgos` (
  `raza_id` int NOT NULL,
  `rasgo_id` int NOT NULL,
  PRIMARY KEY (`raza_id`,`rasgo_id`),
  KEY `fk_raza_rasgo` (`rasgo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `raza_rasgos`
--

INSERT INTO `raza_rasgos` (`raza_id`, `rasgo_id`) VALUES
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subclases`
--

DROP TABLE IF EXISTS `subclases`;
CREATE TABLE IF NOT EXISTS `subclases` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `clase_id` int DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subclases`
--

INSERT INTO `subclases` (`id`, `clase_id`, `nombre`, `descripcion`) VALUES
(1, 1, 'Juramento de Devoción', 'El Juramento de Devoción une al paladín a los más nobles ideales de justicia, virtud y orden. Estos paladines encarnan el ideal del caballero de brillante armadura, actuando con honor en busca de la justicia y el bien común.'),
(2, 1, 'Juramento de los Ancestros', 'El Juramento de los Ancestros es tan antiguo como la raza élfica y los rituales de los druidas. Estos paladines luchan del lado de la luz en el conflicto cósmico en contra de la oscuridad porque aman la belleza y las cosas llenas de vida.'),
(3, 1, 'Juramento de Venganza', 'El Juramento de Venganza es una solemne promesa de castigar a aquellos que han cometido un gravísimo pecado. Estos paladines surgen para enderezar aquello que ha ido mal.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subclase_rasgos`
--

DROP TABLE IF EXISTS `subclase_rasgos`;
CREATE TABLE IF NOT EXISTS `subclase_rasgos` (
  `subclase_id` int NOT NULL,
  `rasgo_id` int NOT NULL,
  `nivel_requerido` int DEFAULT NULL,
  PRIMARY KEY (`subclase_id`,`rasgo_id`),
  KEY `fk_subclase_rasgo` (`rasgo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subclase_rasgos`
--

INSERT INTO `subclase_rasgos` (`subclase_id`, `rasgo_id`, `nivel_requerido`) VALUES
(1, 24, 3),
(1, 25, 3),
(1, 26, 7),
(1, 27, 15),
(1, 28, 20),
(2, 29, 3),
(2, 30, 3),
(2, 31, 7),
(2, 32, 15),
(2, 33, 20),
(3, 34, 3),
(3, 35, 3),
(3, 36, 7),
(3, 37, 15),
(3, 38, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subrazas`
--

DROP TABLE IF EXISTS `subrazas`;
CREATE TABLE IF NOT EXISTS `subrazas` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `raza_id` int DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subrazas`
--

INSERT INTO `subrazas` (`id`, `raza_id`, `nombre`, `descripcion`) VALUES
(1, 2, 'Enano de las Colinas', 'Como enano de las colinas tienes sentidos perspicaces, una profunda intuición y una notable resistencia. Tu puntuación de Sabiduría aumenta en 1 y tus puntos de golpe máximos aumentan en 1 cada vez que ganas un nivel.'),
(2, 2, 'Enano de las Montañas', 'Como enano de las montañas eres fuerte y duro, acostumbrado a una vida difícil en un terreno áspero. Tu puntuación de Fuerza aumenta en 2 y tienes competencia con armaduras ligeras y medias.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subrazas_bonificadores`
--

DROP TABLE IF EXISTS `subrazas_bonificadores`;
CREATE TABLE IF NOT EXISTS `subrazas_bonificadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subraza_id` int NOT NULL,
  `tipo` enum('atributo','pg_por_nivel','competencia_armadura','competencia_arma') COLLATE utf8mb4_unicode_ci NOT NULL,
  `atributo_id` int DEFAULT NULL,
  `valor` int DEFAULT '0',
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subraza_id` (`subraza_id`),
  KEY `atributo_id` (`atributo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subrazas_bonificadores`
--

INSERT INTO `subrazas_bonificadores` (`id`, `subraza_id`, `tipo`, `atributo_id`, `valor`, `descripcion`) VALUES
(1, 1, 'atributo', 5, 1, NULL),
(2, 1, 'pg_por_nivel', NULL, 1, 'Tus puntos de golpe máximos aumentan en 1 cada vez que ganas un nivel'),
(3, 2, 'atributo', 1, 2, NULL),
(4, 2, 'competencia_armadura', NULL, 0, 'Competencia con armaduras ligeras y medias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tamanos`
--

DROP TABLE IF EXISTS `tamanos`;
CREATE TABLE IF NOT EXISTS `tamanos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tamanos`
--

INSERT INTO `tamanos` (`id`, `nombre`) VALUES
(1, 'Diminuto'),
(2, 'Pequeño'),
(3, 'Mediano'),
(4, 'Grande'),
(5, 'Enorme'),
(6, 'Gargantuesco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_criatura`
--

DROP TABLE IF EXISTS `tipos_criatura`;
CREATE TABLE IF NOT EXISTS `tipos_criatura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_criatura`
--

INSERT INTO `tipos_criatura` (`id`, `nombre`) VALUES
(1, 'Bestia'),
(2, 'Humanoide'),
(3, 'No muerto'),
(4, 'Aberración'),
(5, 'Dragón'),
(6, 'Constructo'),
(7, 'Demonio'),
(8, 'Diablo'),
(9, 'Elemental'),
(10, 'Feérico'),
(11, 'Gigante'),
(12, 'Monstruosidad'),
(13, 'Planta'),
(14, 'Cieno'),
(15, 'Celestial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trasfondos`
--

DROP TABLE IF EXISTS `trasfondos`;
CREATE TABLE IF NOT EXISTS `trasfondos` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trasfondo_competencias`
--

DROP TABLE IF EXISTS `trasfondo_competencias`;
CREATE TABLE IF NOT EXISTS `trasfondo_competencias` (
  `trasfondo_id` int NOT NULL,
  `competencia_id` int NOT NULL,
  PRIMARY KEY (`trasfondo_id`,`competencia_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trasfondo_idiomas`
--

DROP TABLE IF EXISTS `trasfondo_idiomas`;
CREATE TABLE IF NOT EXISTS `trasfondo_idiomas` (
  `trasfondo_id` int NOT NULL,
  `idioma_id` int NOT NULL,
  `cantidad` int DEFAULT '1',
  PRIMARY KEY (`trasfondo_id`,`idioma_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `email`, `password_hash`, `created_at`, `updated_at`) VALUES
(1, 'Korven', 'javiercalzadodelrio@gmail.com', 'dnd123', '2026-03-05 19:00:57', '2026-03-05 19:00:57'),
(2, 'pepito', 'pepito@gmail.com', 'dnd321', '2026-03-05 19:08:47', '2026-03-05 19:08:47');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
