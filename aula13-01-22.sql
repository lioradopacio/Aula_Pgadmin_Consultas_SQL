-- Selecione os diferentes anos das datas de chegadas (scheduled_arrival) dos voos.
select distinct extract (year from scheduled_arrival) from bookings.flights;

-- Selecione os diferentes meses de voos de partida (flights.scheduled_departure).
select distinct extract (month from scheduled_departure) from bookings.flights;

-- Apresente o nome dos diferentes tipos de classes de voo (ticket_flghts.fare_conditions) com todos por caracteres em minúsculo
select distinct lower (fare_conditions) from bookings.ticket_flights;

--Apresente o dia, mês e ano dos voos de chegada separadas por hifen em uma única coluna.
SELECT concat(EXTRACT (DAY FROM scheduled_arrival), '-', EXTRACT (MONTH FROM scheduled_arrival),  '-', EXTRACT (YEAR FROM scheduled_arrival)) FROM bookings.flights;
--pesquisar concat_ws*


--Selecione o número de voos de chegada que ocorreram por dia e apresente-os de maneira em que os dias tiveram mais voos de chegada apareçam primeiro.
select extract (day from scheduled_arrival), count(*) from bookings.flights
group by extract(day from scheduled_arrival)
order by count(*) desc;

--Apresente o número máximo de voos de chegada que cada aeroporto recebeu por dia
select arrival_airport, count(flight_no) from bookings.flights
group by arrival_airport
order by count(flight_no) desc
limit 1;

-- Apresente o número de vezes em que cada assento foi escolhido pelo nome do passageiro que mais comprou tickets.

