CREATE DATABASE db_vuelos;

USE db_vuelos;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(60) NOT NULL,
  `fullname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `username`, `password`, `fullname`) VALUES
(1, 'jandrade', 'password1', 'John Andrade');

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

CREATE TABLE `flight_arrivals` (
  `id` int(11) NOT NULL,
  `from_flight` varchar(150) NOT NULL,
  `time_flight` time DEFAULT NULL,
  `number_flight` varchar(25) NOT NULL,
  `remarks` varchar(150) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `flight_arrivals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_arrivals` (`user_id`);

ALTER TABLE `flight_arrivals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;  

ALTER TABLE `flight_arrivals`
  ADD CONSTRAINT `fk_user_arrivals` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

CREATE TABLE `flight_departures` (
  `id` int(11) NOT NULL,
  `to_flight` varchar(150) NOT NULL,
  `time_flight` time DEFAULT NULL,
  `number_flight` varchar(25) NOT NULL,
  `gate` char(3) NOT NULL,
  `remarks` varchar(150) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `flight_departures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_departures` (`user_id`);

ALTER TABLE `flight_departures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;  

ALTER TABLE `flight_departures`
  ADD CONSTRAINT `fk_user_departures` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);