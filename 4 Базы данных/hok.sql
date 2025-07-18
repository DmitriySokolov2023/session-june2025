PGDMP  .    %                }            hok    17.5    17.5 <               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    16676    hok    DATABASE     f   CREATE DATABASE hok WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru';
    DROP DATABASE hok;
                     postgres    false                        2615    16677    hockey_schema    SCHEMA        CREATE SCHEMA hockey_schema;
    DROP SCHEMA hockey_schema;
                     postgres    false            �            1259    16717    goals    TABLE     1  CREATE TABLE hockey_schema.goals (
    goal_id integer NOT NULL,
    match_id integer,
    player_id integer,
    team_id integer,
    goal_time time without time zone,
    period integer,
    goal_type character varying(50),
    CONSTRAINT goals_period_check CHECK (((period >= 1) AND (period <= 3)))
);
     DROP TABLE hockey_schema.goals;
       hockey_schema         heap r       postgres    false    6            �            1259    16716    goals_goal_id_seq    SEQUENCE     �   CREATE SEQUENCE hockey_schema.goals_goal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE hockey_schema.goals_goal_id_seq;
       hockey_schema               postgres    false    6    225                       0    0    goals_goal_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE hockey_schema.goals_goal_id_seq OWNED BY hockey_schema.goals.goal_id;
          hockey_schema               postgres    false    224            �            1259    16698    matches    TABLE     �   CREATE TABLE hockey_schema.matches (
    match_id integer NOT NULL,
    date date NOT NULL,
    location character varying(100),
    home_team_id integer,
    away_team_id integer,
    home_score integer DEFAULT 0,
    away_score integer DEFAULT 0
);
 "   DROP TABLE hockey_schema.matches;
       hockey_schema         heap r       postgres    false    6            �            1259    16697    matches_match_id_seq    SEQUENCE     �   CREATE SEQUENCE hockey_schema.matches_match_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE hockey_schema.matches_match_id_seq;
       hockey_schema               postgres    false    223    6                       0    0    matches_match_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE hockey_schema.matches_match_id_seq OWNED BY hockey_schema.matches.match_id;
          hockey_schema               postgres    false    222            �            1259    16740 	   penalties    TABLE     ~  CREATE TABLE hockey_schema.penalties (
    penalty_id integer NOT NULL,
    match_id integer,
    player_id integer,
    team_id integer,
    penalty_time time without time zone,
    period integer,
    minutes integer,
    reason text,
    CONSTRAINT penalties_minutes_check CHECK ((minutes > 0)),
    CONSTRAINT penalties_period_check CHECK (((period >= 1) AND (period <= 3)))
);
 $   DROP TABLE hockey_schema.penalties;
       hockey_schema         heap r       postgres    false    6            �            1259    16739    penalties_penalty_id_seq    SEQUENCE     �   CREATE SEQUENCE hockey_schema.penalties_penalty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE hockey_schema.penalties_penalty_id_seq;
       hockey_schema               postgres    false    6    227                       0    0    penalties_penalty_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE hockey_schema.penalties_penalty_id_seq OWNED BY hockey_schema.penalties.penalty_id;
          hockey_schema               postgres    false    226            �            1259    16686    players    TABLE     �   CREATE TABLE hockey_schema.players (
    player_id integer NOT NULL,
    name character varying(100) NOT NULL,
    number integer NOT NULL,
    "position" character varying(50),
    team_id integer
);
 "   DROP TABLE hockey_schema.players;
       hockey_schema         heap r       postgres    false    6            �            1259    16685    players_player_id_seq    SEQUENCE     �   CREATE SEQUENCE hockey_schema.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE hockey_schema.players_player_id_seq;
       hockey_schema               postgres    false    221    6            	           0    0    players_player_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE hockey_schema.players_player_id_seq OWNED BY hockey_schema.players.player_id;
          hockey_schema               postgres    false    220            �            1259    16679    teams    TABLE     �   CREATE TABLE hockey_schema.teams (
    team_id integer NOT NULL,
    name character varying(100) NOT NULL,
    city character varying(100),
    coach character varying(100)
);
     DROP TABLE hockey_schema.teams;
       hockey_schema         heap r       postgres    false    6            �            1259    16678    teams_team_id_seq    SEQUENCE     �   CREATE SEQUENCE hockey_schema.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE hockey_schema.teams_team_id_seq;
       hockey_schema               postgres    false    6    219            
           0    0    teams_team_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE hockey_schema.teams_team_id_seq OWNED BY hockey_schema.teams.team_id;
          hockey_schema               postgres    false    218            �            1259    16771 	   employees    TABLE     �   CREATE TABLE public.employees (
    id integer NOT NULL,
    name character varying(100),
    role character varying(50),
    location_id integer
);
    DROP TABLE public.employees;
       public         heap r       postgres    false            �            1259    16770    employees_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public               postgres    false    230                       0    0    employees_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;
          public               postgres    false    229            �            1259    16765 	   locations    TABLE     �   CREATE TABLE public.locations (
    id integer NOT NULL,
    city character varying(100),
    postal_code character varying(20)
);
    DROP TABLE public.locations;
       public         heap r       postgres    false            D           2604    16720    goals goal_id    DEFAULT     |   ALTER TABLE ONLY hockey_schema.goals ALTER COLUMN goal_id SET DEFAULT nextval('hockey_schema.goals_goal_id_seq'::regclass);
 C   ALTER TABLE hockey_schema.goals ALTER COLUMN goal_id DROP DEFAULT;
       hockey_schema               postgres    false    225    224    225            A           2604    16701    matches match_id    DEFAULT     �   ALTER TABLE ONLY hockey_schema.matches ALTER COLUMN match_id SET DEFAULT nextval('hockey_schema.matches_match_id_seq'::regclass);
 F   ALTER TABLE hockey_schema.matches ALTER COLUMN match_id DROP DEFAULT;
       hockey_schema               postgres    false    222    223    223            E           2604    16743    penalties penalty_id    DEFAULT     �   ALTER TABLE ONLY hockey_schema.penalties ALTER COLUMN penalty_id SET DEFAULT nextval('hockey_schema.penalties_penalty_id_seq'::regclass);
 J   ALTER TABLE hockey_schema.penalties ALTER COLUMN penalty_id DROP DEFAULT;
       hockey_schema               postgres    false    227    226    227            @           2604    16689    players player_id    DEFAULT     �   ALTER TABLE ONLY hockey_schema.players ALTER COLUMN player_id SET DEFAULT nextval('hockey_schema.players_player_id_seq'::regclass);
 G   ALTER TABLE hockey_schema.players ALTER COLUMN player_id DROP DEFAULT;
       hockey_schema               postgres    false    221    220    221            ?           2604    16682    teams team_id    DEFAULT     |   ALTER TABLE ONLY hockey_schema.teams ALTER COLUMN team_id SET DEFAULT nextval('hockey_schema.teams_team_id_seq'::regclass);
 C   ALTER TABLE hockey_schema.teams ALTER COLUMN team_id DROP DEFAULT;
       hockey_schema               postgres    false    219    218    219            F           2604    16774    employees id    DEFAULT     l   ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    230    229    230            �          0    16717    goals 
   TABLE DATA           k   COPY hockey_schema.goals (goal_id, match_id, player_id, team_id, goal_time, period, goal_type) FROM stdin;
    hockey_schema               postgres    false    225   cK       �          0    16698    matches 
   TABLE DATA           v   COPY hockey_schema.matches (match_id, date, location, home_team_id, away_team_id, home_score, away_score) FROM stdin;
    hockey_schema               postgres    false    223   �K       �          0    16740 	   penalties 
   TABLE DATA           {   COPY hockey_schema.penalties (penalty_id, match_id, player_id, team_id, penalty_time, period, minutes, reason) FROM stdin;
    hockey_schema               postgres    false    227   �K       �          0    16686    players 
   TABLE DATA           V   COPY hockey_schema.players (player_id, name, number, "position", team_id) FROM stdin;
    hockey_schema               postgres    false    221   L       �          0    16679    teams 
   TABLE DATA           B   COPY hockey_schema.teams (team_id, name, city, coach) FROM stdin;
    hockey_schema               postgres    false    219   �L       �          0    16771 	   employees 
   TABLE DATA           @   COPY public.employees (id, name, role, location_id) FROM stdin;
    public               postgres    false    230   M       �          0    16765 	   locations 
   TABLE DATA           :   COPY public.locations (id, city, postal_code) FROM stdin;
    public               postgres    false    228   mM                  0    0    goals_goal_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('hockey_schema.goals_goal_id_seq', 1, false);
          hockey_schema               postgres    false    224                       0    0    matches_match_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('hockey_schema.matches_match_id_seq', 3, true);
          hockey_schema               postgres    false    222                       0    0    penalties_penalty_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('hockey_schema.penalties_penalty_id_seq', 1, false);
          hockey_schema               postgres    false    226                       0    0    players_player_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('hockey_schema.players_player_id_seq', 3, true);
          hockey_schema               postgres    false    220                       0    0    teams_team_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('hockey_schema.teams_team_id_seq', 3, true);
          hockey_schema               postgres    false    218                       0    0    employees_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.employees_id_seq', 3, true);
          public               postgres    false    229            Q           2606    16723    goals goals_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY hockey_schema.goals
    ADD CONSTRAINT goals_pkey PRIMARY KEY (goal_id);
 A   ALTER TABLE ONLY hockey_schema.goals DROP CONSTRAINT goals_pkey;
       hockey_schema                 postgres    false    225            O           2606    16705    matches matches_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY hockey_schema.matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (match_id);
 E   ALTER TABLE ONLY hockey_schema.matches DROP CONSTRAINT matches_pkey;
       hockey_schema                 postgres    false    223            S           2606    16749    penalties penalties_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY hockey_schema.penalties
    ADD CONSTRAINT penalties_pkey PRIMARY KEY (penalty_id);
 I   ALTER TABLE ONLY hockey_schema.penalties DROP CONSTRAINT penalties_pkey;
       hockey_schema                 postgres    false    227            M           2606    16691    players players_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY hockey_schema.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);
 E   ALTER TABLE ONLY hockey_schema.players DROP CONSTRAINT players_pkey;
       hockey_schema                 postgres    false    221            K           2606    16684    teams teams_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY hockey_schema.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);
 A   ALTER TABLE ONLY hockey_schema.teams DROP CONSTRAINT teams_pkey;
       hockey_schema                 postgres    false    219            W           2606    16776    employees employees_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public                 postgres    false    230            U           2606    16769    locations locations_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public                 postgres    false    228            [           2606    16724    goals goals_match_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hockey_schema.goals
    ADD CONSTRAINT goals_match_id_fkey FOREIGN KEY (match_id) REFERENCES hockey_schema.matches(match_id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY hockey_schema.goals DROP CONSTRAINT goals_match_id_fkey;
       hockey_schema               postgres    false    223    4687    225            \           2606    16729    goals goals_player_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hockey_schema.goals
    ADD CONSTRAINT goals_player_id_fkey FOREIGN KEY (player_id) REFERENCES hockey_schema.players(player_id);
 K   ALTER TABLE ONLY hockey_schema.goals DROP CONSTRAINT goals_player_id_fkey;
       hockey_schema               postgres    false    225    4685    221            ]           2606    16734    goals goals_team_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hockey_schema.goals
    ADD CONSTRAINT goals_team_id_fkey FOREIGN KEY (team_id) REFERENCES hockey_schema.teams(team_id);
 I   ALTER TABLE ONLY hockey_schema.goals DROP CONSTRAINT goals_team_id_fkey;
       hockey_schema               postgres    false    4683    219    225            Y           2606    16711 !   matches matches_away_team_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hockey_schema.matches
    ADD CONSTRAINT matches_away_team_id_fkey FOREIGN KEY (away_team_id) REFERENCES hockey_schema.teams(team_id);
 R   ALTER TABLE ONLY hockey_schema.matches DROP CONSTRAINT matches_away_team_id_fkey;
       hockey_schema               postgres    false    223    219    4683            Z           2606    16706 !   matches matches_home_team_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hockey_schema.matches
    ADD CONSTRAINT matches_home_team_id_fkey FOREIGN KEY (home_team_id) REFERENCES hockey_schema.teams(team_id);
 R   ALTER TABLE ONLY hockey_schema.matches DROP CONSTRAINT matches_home_team_id_fkey;
       hockey_schema               postgres    false    223    219    4683            ^           2606    16750 !   penalties penalties_match_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hockey_schema.penalties
    ADD CONSTRAINT penalties_match_id_fkey FOREIGN KEY (match_id) REFERENCES hockey_schema.matches(match_id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY hockey_schema.penalties DROP CONSTRAINT penalties_match_id_fkey;
       hockey_schema               postgres    false    227    4687    223            _           2606    16755 "   penalties penalties_player_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hockey_schema.penalties
    ADD CONSTRAINT penalties_player_id_fkey FOREIGN KEY (player_id) REFERENCES hockey_schema.players(player_id);
 S   ALTER TABLE ONLY hockey_schema.penalties DROP CONSTRAINT penalties_player_id_fkey;
       hockey_schema               postgres    false    221    227    4685            `           2606    16760     penalties penalties_team_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hockey_schema.penalties
    ADD CONSTRAINT penalties_team_id_fkey FOREIGN KEY (team_id) REFERENCES hockey_schema.teams(team_id);
 Q   ALTER TABLE ONLY hockey_schema.penalties DROP CONSTRAINT penalties_team_id_fkey;
       hockey_schema               postgres    false    219    227    4683            X           2606    16692    players players_team_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hockey_schema.players
    ADD CONSTRAINT players_team_id_fkey FOREIGN KEY (team_id) REFERENCES hockey_schema.teams(team_id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY hockey_schema.players DROP CONSTRAINT players_team_id_fkey;
       hockey_schema               postgres    false    4683    221    219            a           2606    16777    employees fk_location    FK CONSTRAINT     |   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES public.locations(id);
 ?   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_location;
       public               postgres    false    230    4693    228            �      x������ � �      �   b   x�E��
@P��7Oq_�f`))ek3]�(����ʂ�>e��M�}�\��� PdP��'W��Z�͇���o	���V�6L��FN}JD��      �      x������ � �      �   f   x�3�t�I�H�KI-R�.��K-)�/�44�t�/*O,J�4�2��M���U�/�Jq������rqsz�T&*�g��9��s�SSR�8��b���� ��m      �   q   x�%�A
�0@���sA{)R�Bn�vHĘ�����7���_� zxֈ���	zI���s���C%���d=�J/~����v_5v���GlɅrz�E���L?1WƘ/�&w      �   W   x�3��,K�SH-)�/�t�OL��4�2��M,�LT��,��/K�Ȩ,���4�2�t�I�H�T����j�M�KLO-�4����� �MX      �   �   x�-��
�0 ϻ_�/�<�ؽzz��E�J �5i����:30
��r %u�F���AI2x�0([]��y�ֶ�[�y/au�mi�?"z��9�4�mf �����NyO�;���)��޻RV�)"��̜
í��QI�B,>p�<<�IР�y@�/3�     