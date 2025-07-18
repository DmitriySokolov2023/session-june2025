PGDMP      &                }            fp    17.5    17.5 4    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16611    fp    DATABASE     e   CREATE DATABASE fp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru';
    DROP DATABASE fp;
                     postgres    false                        2615    16612    pizza_schema    SCHEMA        CREATE SCHEMA pizza_schema;
    DROP SCHEMA pizza_schema;
                     pg_database_owner    false            �           0    0    SCHEMA pizza_schema    COMMENT     <   COMMENT ON SCHEMA pizza_schema IS 'standard public schema';
                        pg_database_owner    false    5            �            1259    16613 	   customers    TABLE     �   CREATE TABLE pizza_schema.customers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    phone character varying(15) NOT NULL,
    address character varying(255),
    email character varying(100)
);
 #   DROP TABLE pizza_schema.customers;
       pizza_schema         heap r       postgres    false    5            �            1259    16616    customers_id_seq    SEQUENCE     �   CREATE SEQUENCE pizza_schema.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE pizza_schema.customers_id_seq;
       pizza_schema               postgres    false    5    217            �           0    0    customers_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE pizza_schema.customers_id_seq OWNED BY pizza_schema.customers.id;
          pizza_schema               postgres    false    218            �            1259    16617 	   employees    TABLE     �   CREATE TABLE pizza_schema.employees (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    role character varying(50) NOT NULL,
    phone character varying(15) NOT NULL,
    hire_date date,
    location_id integer
);
 #   DROP TABLE pizza_schema.employees;
       pizza_schema         heap r       postgres    false    5            �            1259    16620    employees_id_seq    SEQUENCE     �   CREATE SEQUENCE pizza_schema.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE pizza_schema.employees_id_seq;
       pizza_schema               postgres    false    219    5            �           0    0    employees_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE pizza_schema.employees_id_seq OWNED BY pizza_schema.employees.id;
          pizza_schema               postgres    false    220            �            1259    16782 	   locations    TABLE     �   CREATE TABLE pizza_schema.locations (
    id integer NOT NULL,
    city character varying(100),
    postal_code character varying(20)
);
 #   DROP TABLE pizza_schema.locations;
       pizza_schema         heap r       postgres    false    5            �            1259    16621    orderdetails    TABLE     �   CREATE TABLE pizza_schema.orderdetails (
    id integer NOT NULL,
    order_id integer NOT NULL,
    pizza_id integer NOT NULL,
    quantity integer NOT NULL
);
 &   DROP TABLE pizza_schema.orderdetails;
       pizza_schema         heap r       postgres    false    5            �            1259    16624    orderdetails_id_seq    SEQUENCE     �   CREATE SEQUENCE pizza_schema.orderdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE pizza_schema.orderdetails_id_seq;
       pizza_schema               postgres    false    221    5            �           0    0    orderdetails_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE pizza_schema.orderdetails_id_seq OWNED BY pizza_schema.orderdetails.id;
          pizza_schema               postgres    false    222            �            1259    16625    orders    TABLE     �   CREATE TABLE pizza_schema.orders (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    employee_id integer,
    total_price numeric(10,2),
    order_date date
);
     DROP TABLE pizza_schema.orders;
       pizza_schema         heap r       postgres    false    5            �            1259    16628    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE pizza_schema.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE pizza_schema.orders_id_seq;
       pizza_schema               postgres    false    5    223            �           0    0    orders_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE pizza_schema.orders_id_seq OWNED BY pizza_schema.orders.id;
          pizza_schema               postgres    false    224            �            1259    16629    pizzas    TABLE     �   CREATE TABLE pizza_schema.pizzas (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    price numeric(10,2) NOT NULL
);
     DROP TABLE pizza_schema.pizzas;
       pizza_schema         heap r       postgres    false    5            �            1259    16634    pizzas_id_seq    SEQUENCE     �   CREATE SEQUENCE pizza_schema.pizzas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE pizza_schema.pizzas_id_seq;
       pizza_schema               postgres    false    225    5            �           0    0    pizzas_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE pizza_schema.pizzas_id_seq OWNED BY pizza_schema.pizzas.id;
          pizza_schema               postgres    false    226            9           2604    16635    customers id    DEFAULT     x   ALTER TABLE ONLY pizza_schema.customers ALTER COLUMN id SET DEFAULT nextval('pizza_schema.customers_id_seq'::regclass);
 A   ALTER TABLE pizza_schema.customers ALTER COLUMN id DROP DEFAULT;
       pizza_schema               postgres    false    218    217            :           2604    16636    employees id    DEFAULT     x   ALTER TABLE ONLY pizza_schema.employees ALTER COLUMN id SET DEFAULT nextval('pizza_schema.employees_id_seq'::regclass);
 A   ALTER TABLE pizza_schema.employees ALTER COLUMN id DROP DEFAULT;
       pizza_schema               postgres    false    220    219            ;           2604    16637    orderdetails id    DEFAULT     ~   ALTER TABLE ONLY pizza_schema.orderdetails ALTER COLUMN id SET DEFAULT nextval('pizza_schema.orderdetails_id_seq'::regclass);
 D   ALTER TABLE pizza_schema.orderdetails ALTER COLUMN id DROP DEFAULT;
       pizza_schema               postgres    false    222    221            <           2604    16638 	   orders id    DEFAULT     r   ALTER TABLE ONLY pizza_schema.orders ALTER COLUMN id SET DEFAULT nextval('pizza_schema.orders_id_seq'::regclass);
 >   ALTER TABLE pizza_schema.orders ALTER COLUMN id DROP DEFAULT;
       pizza_schema               postgres    false    224    223            =           2604    16639 	   pizzas id    DEFAULT     r   ALTER TABLE ONLY pizza_schema.pizzas ALTER COLUMN id SET DEFAULT nextval('pizza_schema.pizzas_id_seq'::regclass);
 >   ALTER TABLE pizza_schema.pizzas ALTER COLUMN id DROP DEFAULT;
       pizza_schema               postgres    false    226    225            �          0    16613 	   customers 
   TABLE DATA           J   COPY pizza_schema.customers (id, name, phone, address, email) FROM stdin;
    pizza_schema               postgres    false    217   =       �          0    16617 	   employees 
   TABLE DATA           X   COPY pizza_schema.employees (id, name, role, phone, hire_date, location_id) FROM stdin;
    pizza_schema               postgres    false    219   .>       �          0    16782 	   locations 
   TABLE DATA           @   COPY pizza_schema.locations (id, city, postal_code) FROM stdin;
    pizza_schema               postgres    false    227   M?       �          0    16621    orderdetails 
   TABLE DATA           N   COPY pizza_schema.orderdetails (id, order_id, pizza_id, quantity) FROM stdin;
    pizza_schema               postgres    false    221   �?       �          0    16625    orders 
   TABLE DATA           ]   COPY pizza_schema.orders (id, customer_id, employee_id, total_price, order_date) FROM stdin;
    pizza_schema               postgres    false    223   E@       �          0    16629    pizzas 
   TABLE DATA           D   COPY pizza_schema.pizzas (id, name, description, price) FROM stdin;
    pizza_schema               postgres    false    225   �@       �           0    0    customers_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('pizza_schema.customers_id_seq', 6, true);
          pizza_schema               postgres    false    218            �           0    0    employees_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('pizza_schema.employees_id_seq', 32, true);
          pizza_schema               postgres    false    220            �           0    0    orderdetails_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('pizza_schema.orderdetails_id_seq', 29, true);
          pizza_schema               postgres    false    222                        0    0    orders_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('pizza_schema.orders_id_seq', 31, true);
          pizza_schema               postgres    false    224                       0    0    pizzas_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('pizza_schema.pizzas_id_seq', 20, true);
          pizza_schema               postgres    false    226            ?           2606    16641    customers customers_email_key 
   CONSTRAINT     _   ALTER TABLE ONLY pizza_schema.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);
 M   ALTER TABLE ONLY pizza_schema.customers DROP CONSTRAINT customers_email_key;
       pizza_schema                 postgres    false    217            A           2606    16643    customers customers_phone_key 
   CONSTRAINT     _   ALTER TABLE ONLY pizza_schema.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);
 M   ALTER TABLE ONLY pizza_schema.customers DROP CONSTRAINT customers_phone_key;
       pizza_schema                 postgres    false    217            C           2606    16645    customers customers_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY pizza_schema.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY pizza_schema.customers DROP CONSTRAINT customers_pkey;
       pizza_schema                 postgres    false    217            E           2606    16647    employees employees_phone_key 
   CONSTRAINT     _   ALTER TABLE ONLY pizza_schema.employees
    ADD CONSTRAINT employees_phone_key UNIQUE (phone);
 M   ALTER TABLE ONLY pizza_schema.employees DROP CONSTRAINT employees_phone_key;
       pizza_schema                 postgres    false    219            G           2606    16649    employees employees_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY pizza_schema.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY pizza_schema.employees DROP CONSTRAINT employees_pkey;
       pizza_schema                 postgres    false    219            O           2606    16786    locations locations_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY pizza_schema.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY pizza_schema.locations DROP CONSTRAINT locations_pkey;
       pizza_schema                 postgres    false    227            I           2606    16651    orderdetails orderdetails_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY pizza_schema.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY pizza_schema.orderdetails DROP CONSTRAINT orderdetails_pkey;
       pizza_schema                 postgres    false    221            K           2606    16653    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY pizza_schema.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY pizza_schema.orders DROP CONSTRAINT orders_pkey;
       pizza_schema                 postgres    false    223            M           2606    16655    pizzas pizzas_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY pizza_schema.pizzas
    ADD CONSTRAINT pizzas_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY pizza_schema.pizzas DROP CONSTRAINT pizzas_pkey;
       pizza_schema                 postgres    false    225            S           2606    16656    orders fk_customer    FK CONSTRAINT     �   ALTER TABLE ONLY pizza_schema.orders
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES pizza_schema.customers(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY pizza_schema.orders DROP CONSTRAINT fk_customer;
       pizza_schema               postgres    false    223    217    4675            T           2606    16661    orders fk_employee    FK CONSTRAINT     �   ALTER TABLE ONLY pizza_schema.orders
    ADD CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES pizza_schema.employees(id) ON DELETE SET NULL;
 B   ALTER TABLE ONLY pizza_schema.orders DROP CONSTRAINT fk_employee;
       pizza_schema               postgres    false    223    219    4679            P           2606    16787    employees fk_location    FK CONSTRAINT     �   ALTER TABLE ONLY pizza_schema.employees
    ADD CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES pizza_schema.locations(id);
 E   ALTER TABLE ONLY pizza_schema.employees DROP CONSTRAINT fk_location;
       pizza_schema               postgres    false    227    4687    219            Q           2606    16666    orderdetails fk_order    FK CONSTRAINT     �   ALTER TABLE ONLY pizza_schema.orderdetails
    ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES pizza_schema.orders(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY pizza_schema.orderdetails DROP CONSTRAINT fk_order;
       pizza_schema               postgres    false    221    223    4683            R           2606    16671    orderdetails fk_pizza    FK CONSTRAINT     �   ALTER TABLE ONLY pizza_schema.orderdetails
    ADD CONSTRAINT fk_pizza FOREIGN KEY (pizza_id) REFERENCES pizza_schema.pizzas(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY pizza_schema.orderdetails DROP CONSTRAINT fk_pizza;
       pizza_schema               postgres    false    4685    221    225            �     x�U��J�@���)���&��?7�K��mZ���AP�"*��Ah����}#����m���7;��D�o�
�X�Q��zA(��b�3�|����;l��Ly,��E@��,?1W�p<0��h腄9*{c�1���a��WTl�����r��$a�L��?E�P9Uk���N}Æ���3�뎩�<��C��7�FL�4I���/���>4��,ϳ��	���{~�/���jeo�r�w���O�m�-[άP7��ѠߵO}��~ !��@      �     x�m�QJ�0E�_V�I^�f�ө◠������X��n�fG�����GJC�s�}\�q@�#�{�������/��K�hq����Z���Ė���+�0\ne��~dx�g�c�4ݎdtKإ�Nn�������3;7���s�k­���(-�6��]�YB�巙r(��
�vF*���L��)�j�$���X�Ζ�o=6���	�:Ã�OP��VN6��<ϋ�,g�>�p�|�F��{N���J:�:^��*��^W�K1q�N�1�����      �   �   x�-��
�0 ϻ_�/�<�ؽzz��E�J �5i����:30
��r %u�F���AI2x�0([]��y�ֶ�[�y/au�mi�?"z��9�4�mf �����NyO�;���)��޻RV�)"��̜
í��QI�B,>p�<<�IР�y@�/3�      �   7   x�ʱ� �x1>o�^�/�h�Xԋ��Z̸pP�7>ԡ���w��J��i      �   W   x�u��� ��.E�!���?G����wg[�
�{r�xL��j��5�M

���'�@v��������׋��������Q�df/ɠ!�      �   �   x�M�A�0E��S��@\�pe�����m��ޒ�v�?o�.8��_������ -kBkG���r�7��ʔ�	
�D~_���dX,yi�T�8(�SO��n���;>�8V�i��,9�y_���Ez�<�qX�nWt=:���6���`�LT�^�9�	m2!�{�P�     