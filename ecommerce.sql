-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2024 a las 00:16:27
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
-- Base de datos: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Acción'),
(2, 'Comedia'),
(3, 'Terror'),
(4, 'Aventura'),
(5, 'Romántica'),
(6, 'Animada'),
(9, 'Ciencia Ficcion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(10) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `comentario` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `pelicula_id` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(10) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(80) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria_id` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `descripcion`, `foto`, `precio`, `categoria_id`, `fecha`, `estado`) VALUES
(1, 'Spider-Man: Un Nuevo Universo', '\"Spider-Man: Un Nuevo Universo\" presenta a Miles Morales, un adolescente de Brooklyn, y a las ilimitadas posibilidades del nuevo universo de Spider-Man, donde más de uno puede llevar máscara.', 'spider-verse1.png', 129.00, 6, '2024-04-01', 1),
(2, 'Transformers', 'El destino de la humanidad está en juego cuando dos razas de robots, los buenos Autobots y los villanos Decepticons, llevan su guerra a la Tierra. Los robots tienen la habilidad de transformarse en diferentes objetos mecánicos mientras buscan la clave del poder supremo. Sólo un joven humano, Sam Witwicky puede salvar al mundo de la destrucción total.', 'transformer.jpg', 269.00, 9, '2024-04-01', 1),
(3, 'Rambo Regreso Al Infierno', 'El ex boina verde John Rambo lleva una solitaria y apacible vida en la jungla del norte de Tailandia, pescando y cazando cobras para venderlas. Todo cambia cuando un grupo de misioneros católicos le proponen que les sirva de guía hasta la frontera con Birmania para suministrar medicinas y alimentos a los refugiados asediados por el ejército birmano, que ha hecho de la tortura y el asesinato una práctica habitual. En estas circunstancias, Rambo no tendrá más remedio que volver a tomar partido.', 'rambo.jpg', 249.00, 1, '2024-04-01', 1),
(4, 'Deadpool', 'Wade Wilson, tras ser sometido a un cruel experimento científico, adquiere poderes especiales que le convierten en Deadpool. Armado con sus nuevas habilidades y un retorcido sentido del humor tratará de dar caza al hombre que casi destruye su vida.', 'deadpool.jpg', 149.00, 1, '2024-04-01', 1),
(5, 'La gran aventura Lego', 'Emmet, una figurilla ordinaria de LEGO, es identificada por error como la persona más extraordinaria y la clave para salvar al mundo. Se ve entonces acompañada por un grupo de desconocidos y juntos se embarcan en una búsqueda para vencer a un terrible tirano con planes malvados.', 'lego.jpg', 129.00, 6, '2024-04-01', 1),
(6, 'Guardianes de la Galaxia', 'El temerario aventurero Peter Quill, tras robar una misteriosa esfera codiciada por Ronan, un poderoso villano cuyas ambiciones amenazan a todo el universo, se convierte en la presa más codiciada por todos los cazarrecompensas de la galaxia.', 'guardianes_de_la_galaxia.jpg', 219.00, 1, '2024-04-01', 1),
(7, 'Batman: el caballero de la noche', 'Con la ayuda del teniente Jim Gordon y del Fiscal del Distrito Harvey Dent, Batman mantiene a raya el crimen organizado en Gotham. Todo cambia cuando aparece el Joker, un nuevo criminal que desencadena el caos y tiene aterrados a los ciudadanos.', 'batman.jpg', 129.00, 1, '2024-04-01', 1),
(8, 'John Wick', 'La ciudad de Nueva York se llena de balas cuando John Wick, un exasesino a sueldo, regresa de su retiro para enfrentar a los mafiosos rusos, liderados por Viggo Tarasov, que destruyeron todo aquello que él amaba y pusieron precio a su cabeza.', 'john-wick.jpg', 129.00, 1, '2024-04-01', 1),
(9, 'Sweet & Sour', 'Una pareja afronta las oportunidades y desafíos del mundo real mientras lidia con los problemas que conlleva mantener a flote una relación a distancia.', 'sweet_&_sour.jpg', 136.00, 5, '2024-04-01', 1),
(10, 'Saw X: el juego del miedo', 'John Kramer conoce a una persona que le promete curarle el cáncer en una clínica de la Ciudad de México. Tras descubrir que todo era una estafa, se venga de los timadores secuestrándolos y obligándolos a participar en un juego perverso.', 'saw_x.jpg', 265.00, 3, '2024-04-01', 1),
(11, 'La sirenita', 'Ariel es una princesa sirena de 16 años de edad cuyo padre es el rey Tritón, el rey gobernante supremo del fondo del mar y del océano, y no está del todo feliz con su vida bajo el mar, pues tiene curiosidad de conocer el mundo de los seres humanos. ', 'the_mermaid.jpg', 198.00, 6, '2024-04-01', 1),
(12, 'Clifford El Gran Perro Rojo', 'Un rescatador de animales le entrega a la joven Emily un cachorro rojo que, en poco tiempo, se convierte en un sabueso gigante. Mientras su madre está viajando por negocios, Emily, el gran perro y su divertido e impulsivo tío viven una aventura.', 'clifford.jpg', 189.00, 4, '2024-04-01', 1),
(13, 'Dragon Ball Super: Broly', 'La paz ha regresado una vez más a la Tierra tras el Torneo de Poder. Al descubrir que en los diferentes universos hay seres increíblemente poderosos que aún no ha visto, Goku tiene intención de seguir entrenando para hacerse aún más fuerte. Entonces, un día, un saiyan llamado Broly al que nunca antes han visto se presenta ante Goku y Vegeta.', 'dragon_ball_broly.jpg', 260.00, 6, '2024-04-01', 1),
(14, 'One Piece Film: Red', 'Uta, la cantante más popular del mundo, va a presentarse en un escenario y revelar su apariencia por primera vez. Luffy y sus amigos acuden al concierto y se dan cuenta de que la voz de Uta es capaz de cambiarlo todo.', 'one_piece_film_red.jpg', 300.00, 6, '2024-04-01', 1),
(15, 'Terrifier', 'En la noche de Halloween, tras una fiesta, Tara y Dawn entran en una pizzería. Tras ellas llega un payaso inquietante y grotesco que hiela la sangre a Tara. Las chicas no tardan en descubrir que es un psicópata sádico que pretende matarlas.', 'terrifier.jpg', 360.00, 3, '2024-04-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `clave` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `clave`, `estado`) VALUES
(1, 'sa', '123456', 1),
(2, 'admin', '250703', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
