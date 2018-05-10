CREATE TABLE "user" (
   user_id       		 CHARACTER VARYING(200) NOT NULL PRIMARY KEY
  ,user_timestamp    TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
  ,user_password 		 CHARACTER VARYING(200) NOT NULL
  ,user_token    		 CHARACTER VARYING(200)
  ,user_verification CHARACTER VARYING(200) DEFAULT NULL
  -- ,CONSTRAINT user_pkey PRIMARY KEY (user_id)
);

-- user_id - емеил
-- user_token - это токен, выдающийся при аутентификации. 
  -- Нужен для сессии, воизбежания работы с куками.
-- user_verification - при регистрации поле будет заполняться призвольными символами. 
  -- Этот код, для дальнейшей верификации через емеил. После верификации в поле кладется 'verified'.
  -- Такой подход позволяет избавится от дополнительного поля user_id_verified BOOLEAN

-- Это кейс для юзеров, которые захотели регаться без вк или фейсбука(он нужен)

-- _timestamp можно ставить везде

CREATE TABLE photo (
   photo_id        SERIAL PRIMARY KEY
  ,photo_timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
  ,photo__user_id  CHARACTER VARYING(200) NOT NULL
  ,FOREIGN KEY (photo__user_id) REFERENCES "user" (user_id)
);

CREATE TABLE question (
   question_id       	SERIAL PRIMARY KEY
  ,question_timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
  ,question_body      TEXT NOT NULL
);

CREATE TABLE answer (
   answer_id       		 SERIAL PRIMARY KEY
  ,answer_timestamp    TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
  ,answer_body         TEXT NOT NULL
  ,answer__question_id INTEGER NOT NULL
  ,FOREIGN KEY (answer_body__question_id) REFERENCES question (question_id)
);

