/* Query */


-- Esercizio 1 (Contare i film di categoria Adventure o Drama)
SELECT
	COUNT(DISTINCT m.movie_id) AS movie_count
FROM
	test.movies m
JOIN test.movies_categories mc ON
	m.movie_id = mc.movie_id
WHERE
	mc.category_id IN (2, 8);


-- Esercizio 2 (Elencare i film con votazione media di 3 o superiore)
SELECT
	movie_id,
	AVG(ml.current_vote) AS average_rating
FROM
	test.movie_likes ml
GROUP BY
	movie_id
HAVING
	AVG(ml.current_vote) >= 3
	
-- Esercizio 3 (Elencare i film con votazione media di 3 o superiore, ma solo a condizione che il film abbia ricevuto almeno 40 voti)
SELECT
	m.movie_id,
	AVG(ml.current_vote) AS average_rating,
	COUNT(ml.movie_like_id) AS total_votes
FROM
	test.movies AS m
JOIN test.movie_likes AS ml ON
	m.movie_id = ml.movie_id
GROUP BY
	m.movie_id
HAVING
	AVG(ml.current_vote) >= 3
	AND COUNT(ml.movie_like_id) >= 40;


-- Esercizio 4 (Elencare i film e, per ciascuno di essi, esporre la differenza tra la durata del film e la durata media dei film usciti nello stesso anno.)
SELECT
	m.movie_id,
	m.title,
	m.duration_in_minutes,
	YEAR(m.release_year) AS release_year,
	m.duration_in_minutes - AVG(m.duration_in_minutes) OVER (PARTITION BY YEAR(m.release_year)) AS diff_from_avg_duration
FROM
	test.movies AS m;
