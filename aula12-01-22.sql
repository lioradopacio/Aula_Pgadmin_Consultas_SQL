-- Selecionar todos os aviões (Aircrafts), os vôos associados a eles (Flights), e verificar os aviões que não realizaram vôos.
SELECT a.model,f.flight_no FROM bookings.aircrafts_data a
LEFT JOIN bookings.Flights f ON a.aircraft_code = f.aircraft_code
ORDER BY a.model NULLS FIRST;

--Selecionar todos os aviões (Aircrafts), os assentos associados a eles (Seats), e verificar os aviões que não possuem assentos cadastrados.
SELECT a.model,b.seat_no FROM bookings.aircrafts_data a
LEFT JOIN bookings.seats b ON a.aircraft_code = b.aircraft_code
ORDER BY b.seat_no NULLS FIRST;

-- Apresentar o número de vôos (Flights) feitos por cada avião (Aircrafts).
SELECT COUNT(b.Flight_id),b.aircraft_code FROM bookings.aircrafts a
RIGHT JOIN bookings.Flights b ON a.aircraft_code = b.aircraft_code
GROUP BY b.aircraft_code;

--Selecionar os diferentes códigos dos aeroportos (Airport).
select distinct(a.airport_code) from bookings.airports a;

--Apresentar o número de aeroportos situados em timezone europeu.
select count(*) from bookings.airports_data ap
where ap.timezone like 'Europe%';

-- Apresentar apenas código do aeroporto (Airport) e o número de voos do aeroporto que teve menos vôos de destino (arrival_airport).
select a.airport_code, count(f.arrival_airport) from bookings.Flights f
right join bookings.Airports a on a.airport_code = f.arrival_airport
group by a.airport_code
order by count(f.arrival_airport) asc
limit 1;

--Selecionar o número de tickets comprados por cada passageiro e ordená-los pelos que mais compraram.
select t.passenger_id , t.passenger_name, count(ts.ticket_no) from bookings.tickets t
inner join bookings.ticket_flights ts on t.ticket_no = ts.ticket_no
group by t.passenger_id, t.passenger_name
order by count(ts.ticket_no) desc limit 5 offset (5000-1)*5;

--Selecionar quantas pessoas viajaram de Business, Comfort e Economy no voo de id 300.
select tf.fare_conditions, count (*) from bookings.ticket_flights tf
where tf.flight_id = 300
group by tf.fare_conditions;

--Selecionar o número de vezes que os assentos foram escolhidos pelos passageiros agrupados por avião e ordenados pelo assento menos escolhido.
select f.aircraft_code, bp.seat_no, count(bp.seat_no) from bookings.boarding_passes bp
inner join bookings.flights f on f.flight_id = bp.flight_id
group by f.aircraft_code, bp.seat_no
order by count(bp.seat_no) asc;

--Selecionar o assento mais escolhido pelos passageiros do avião de código 763.
select f.aircraft_code, bp.seat_no, count(bp.seat_no) from bookings.boarding_passes bp
inner join bookings.flights f on f.flight_id = bp.flight_id
group by f.aircraft_code, bp.seat_no having f.aircraft_code = '763'
order by count(bp.seat_no) desc limit 1;

-- revisar os dois últimos!!


