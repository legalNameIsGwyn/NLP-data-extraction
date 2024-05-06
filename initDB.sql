PGDMP                      |            nlp    16.2    16.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            	           1262    16421    nlp    DATABASE     |   CREATE DATABASE nlp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Philippines.1252';
    DROP DATABASE nlp;
                postgres    false            �            1259    16611 	   languages    TABLE     n   CREATE TABLE public.languages (
    lang_id integer NOT NULL,
    lang_name character varying(20) NOT NULL
);
    DROP TABLE public.languages;
       public         heap    postgres    false            �            1259    16610    languages_lang_id_seq    SEQUENCE     �   CREATE SEQUENCE public.languages_lang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.languages_lang_id_seq;
       public          postgres    false    217            
           0    0    languages_lang_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.languages_lang_id_seq OWNED BY public.languages.lang_id;
          public          postgres    false    216            �            1259    16627    major_dialect    TABLE     �   CREATE TABLE public.major_dialect (
    dialect_id integer NOT NULL,
    region_name character varying(20) NOT NULL,
    dialect character varying(35) NOT NULL
);
 !   DROP TABLE public.major_dialect;
       public         heap    postgres    false            �            1259    16655    major_dialect_dialect_id_seq    SEQUENCE     �   CREATE SEQUENCE public.major_dialect_dialect_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.major_dialect_dialect_id_seq;
       public          postgres    false    221                       0    0    major_dialect_dialect_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.major_dialect_dialect_id_seq OWNED BY public.major_dialect.dialect_id;
          public          postgres    false    222            �            1259    16621    popular_phrases    TABLE     �   CREATE TABLE public.popular_phrases (
    phrase_id integer NOT NULL,
    region_name character varying(20) NOT NULL,
    phrase text NOT NULL,
    phrase_translation text
);
 #   DROP TABLE public.popular_phrases;
       public         heap    postgres    false            �            1259    16620    popular_phrases_phrase_id_seq    SEQUENCE     �   CREATE SEQUENCE public.popular_phrases_phrase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.popular_phrases_phrase_id_seq;
       public          postgres    false    220                       0    0    popular_phrases_phrase_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.popular_phrases_phrase_id_seq OWNED BY public.popular_phrases.phrase_id;
          public          postgres    false    219            �            1259    16617    region_languages    TABLE     �   CREATE TABLE public.region_languages (
    region_name character varying(20) NOT NULL,
    lang_name character varying(30) NOT NULL,
    language_percentage real NOT NULL
);
 $   DROP TABLE public.region_languages;
       public         heap    postgres    false            �            1259    16603    regions    TABLE     �   CREATE TABLE public.regions (
    region_name character varying(20) NOT NULL,
    short_info text,
    population integer,
    area real
);
    DROP TABLE public.regions;
       public         heap    postgres    false            b           2604    16614    languages lang_id    DEFAULT     v   ALTER TABLE ONLY public.languages ALTER COLUMN lang_id SET DEFAULT nextval('public.languages_lang_id_seq'::regclass);
 @   ALTER TABLE public.languages ALTER COLUMN lang_id DROP DEFAULT;
       public          postgres    false    216    217    217            d           2604    16656    major_dialect dialect_id    DEFAULT     �   ALTER TABLE ONLY public.major_dialect ALTER COLUMN dialect_id SET DEFAULT nextval('public.major_dialect_dialect_id_seq'::regclass);
 G   ALTER TABLE public.major_dialect ALTER COLUMN dialect_id DROP DEFAULT;
       public          postgres    false    222    221            c           2604    16624    popular_phrases phrase_id    DEFAULT     �   ALTER TABLE ONLY public.popular_phrases ALTER COLUMN phrase_id SET DEFAULT nextval('public.popular_phrases_phrase_id_seq'::regclass);
 H   ALTER TABLE public.popular_phrases ALTER COLUMN phrase_id DROP DEFAULT;
       public          postgres    false    220    219    220            �          0    16611 	   languages 
   TABLE DATA           7   COPY public.languages (lang_id, lang_name) FROM stdin;
    public          postgres    false    217   �                  0    16627    major_dialect 
   TABLE DATA           I   COPY public.major_dialect (dialect_id, region_name, dialect) FROM stdin;
    public          postgres    false    221   #                 0    16621    popular_phrases 
   TABLE DATA           ]   COPY public.popular_phrases (phrase_id, region_name, phrase, phrase_translation) FROM stdin;
    public          postgres    false    220   P%       �          0    16617    region_languages 
   TABLE DATA           W   COPY public.region_languages (region_name, lang_name, language_percentage) FROM stdin;
    public          postgres    false    218   �'       �          0    16603    regions 
   TABLE DATA           L   COPY public.regions (region_name, short_info, population, area) FROM stdin;
    public          postgres    false    215   w)                  0    0    languages_lang_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.languages_lang_id_seq', 1, false);
          public          postgres    false    216                       0    0    major_dialect_dialect_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.major_dialect_dialect_id_seq', 1, false);
          public          postgres    false    222                       0    0    popular_phrases_phrase_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.popular_phrases_phrase_id_seq', 1, false);
          public          postgres    false    219            l           2606    16661     major_dialect major_dialect_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.major_dialect
    ADD CONSTRAINT major_dialect_pkey PRIMARY KEY (dialect_id);
 J   ALTER TABLE ONLY public.major_dialect DROP CONSTRAINT major_dialect_pkey;
       public            postgres    false    221            h           2606    16616    languages pk_languages 
   CONSTRAINT     Y   ALTER TABLE ONLY public.languages
    ADD CONSTRAINT pk_languages PRIMARY KEY (lang_id);
 @   ALTER TABLE ONLY public.languages DROP CONSTRAINT pk_languages;
       public            postgres    false    217            j           2606    16626 "   popular_phrases pk_popular_phrases 
   CONSTRAINT     g   ALTER TABLE ONLY public.popular_phrases
    ADD CONSTRAINT pk_popular_phrases PRIMARY KEY (phrase_id);
 L   ALTER TABLE ONLY public.popular_phrases DROP CONSTRAINT pk_popular_phrases;
       public            postgres    false    220            f           2606    16609    regions pk_regions 
   CONSTRAINT     Y   ALTER TABLE ONLY public.regions
    ADD CONSTRAINT pk_regions PRIMARY KEY (region_name);
 <   ALTER TABLE ONLY public.regions DROP CONSTRAINT pk_regions;
       public            postgres    false    215            �   !  x�M��n�0E�3_�H+J%-c�!(�� ݌bU&̐�	ԯ�%� ]��!�ME���}����	�����'�X	��~�5�K���
C{�W�	�@����$g\�,�*�흈g��>�6�\���R-'�*��Ab�,˼������eˮj������C��G�gt8I'/I(����<�C�i���XV^Н���=N@�ݒ����N'�}��^l�U�7{}Q�w�٤�5`���e��]�\�C�BQۉ����?KkQP������2U\��+���߉?�����TQQ�]�m�5����j'/���� d~�5���X�.��d����u	|�;7 /�ʺ����ek^א��7�Q�n��zy��p�%�^p����GĊ�'�v۬��Qꈡ\���q`4�1�qY�C�����1iـc��L� ���o��1���Ԝ~���c�
��S7����K��`J���Xc�	���6Ub65p�"5��������,W����޹��$(6��JM�H�%U%=���O\z�O�8��O���n�         '  x�]�ݎ�0���wق'!���*�l�X*�fQbl����O߉	��7H��c�33f���૪�]iø]��Vmń]mjs���m}~B	�)����j�Xdύqp(Je����x�ܶ�h��Vi�,u���s堡d�S����e\Џ?���xH��)�~<��e���*�R�)�tw�݇x�*$O���-��	���tN�t��Sx5�l�Φ���
��憂fBRe�*&"J~�
�	׵c�
m�S��3����x���qNH={3MW��LӚM�s/f��O�^\��\�³�*H��A��pJO��tꂓw���3��4[5����E	��҄�-6þ����ږ5L	\�]���9���"��HN�
t�E���D0գ�2�xoS=�K�7���g��&�82ҿœc	aY�ϩ��]�S�SX*�F�^v.#���F�@|,�,�)�ڝ!����������o&���~t���T/��Q2�X�=,(t&RB��6(�x>�c��O��*:�ϱ��Yߠ!3�É��G���	}�����Wŭ         1  x�m�Ko�0��ɯ�]�}�3U��Eg�΢���8��k�8��ϵi����8�a�}_�d+v��m���{�У���E���D�U�@]�>�y;7 �pDi=���*�Q�ţ$�����$'��Gj�X�=��m�!���:[iE��19"o���!���>��V94q���I8�5Yqa;��r=�p�B�b��'-/�66B;��%�d$s�׆����4��آ�F�t�f�/+�/�_*��~�9B0HVGY�X��+�2����ĿVb��xJ�T�Bì��˘~-0�p�bV|-pXq�wQ�8��.�<zdej��=�N�)�T˫k{��Hۆ{g�8��mW5�c���fϙ:�)���㣙�-��^g����Á�[p����4��j��7��.��Z��5���yY$�u�WTsZJQ��������|-��yu��[�v����"[~��؇KQfϖ?��uį&/�+5���el�i����l1b���,��.�y��ual8Y��8�~�H:ԅ������&y��U�ot      �   �  x�]��N�0���S��8v�f�fs��pU���)D�E���\�<=c;Nl����g�Lڬ���hC��r�5�`0�0Aw`��=�>���؝/��(��=y�KzRJ�׎l��@�26��w�fR����tI��z�3\��E�7�;g�TqQ4aT��m��'��Y�t��6fS���`HN�����.�_�&ⴒپ�ѷ��OF,h�4��;�����<��
��ia�������(�,��%Ԡz�j����H'�my��-�7~7��o��ZZG9�2���bɖ9,��5%�� L�'Q`^<�h;]�I�ܝ�xP�� }��}-�UD���V�ps���n��I~�͖���9 ށ�v�Η�������5)d
熮&%a�*�N��%��%�I�q<�qk0�7�����n�p�/�2�ӥ��JB;�s�m���������,�~ ��R�      �   �  x��Zے�6}��o��4��]r�4�˪�����n�"!

PR�i?b�p�dO7 ^�M���2	}=}�����������tQ�R�uv�F����>)�^�������+�(�P���B��ʄ6b�Z.�B����9mr��Iq,�I�T��b�-�P���,�P�(�ת�ͮ���w��cXqgkSIl�.<;�d̓��ڋ��ڊ[]��ѕ�2�*�7{P����B�d:W��Nlr[�JT��bC]�����u�C<Zҙt�4�ɬzZU]���&��"}��5Y�R9[�P���N<�h�Ζ��3H�EW��K}��.δEc�ǽ.��y��Q����¦i}��I�/���b�¦ZGY�T
���;8I�d�D��x'�̷8U���ɯ�z�� -�TA�.2z���N���SV���;�j����o�y�8ѩȖ)-�1���|K���x��3Zǫ�p���?�~�`&Ғ	�`��Dj�S}D�x;V�V���Ԛ�9����`����G����˳K��j1�_��e2�xs��k�n�QW������B�;U�V�I�ī�8Z/�� ����?�{��v������x��]"6U���G�ӍB��v97��[j2�6C`e���B|oq��֞Ti��'Li����<���Fum{��.�:�$>���w��[$�8ȳE�u��E�^RP�R�+��٥�<�;�ޒ�9�.����{J���֖{k3��|t�8���'��\H���}�]��7dTm�h�' ������-�\�]Q+�%D�d��N���|2�~w7�����»�j���)lj]H�訫9�XH^4����H"�^RL���ן8����4�T��]�V"x�aEu�� b�x�"�O���L��+M_�髸�#�Ž�q		`��F��Z��Ͽ��~E����}]!b6X����y4@�m�moCx�4%�w�$�A�bK�t�)���.$�?�g׹-/�vv�}��\�����@�K3G�b���&�S!:V����0���X�z
�#��D��Ҍ���:7،�fQ���A�oK���;Y>$�+u�9�dO�gBZ�O��p��˭�����X׳�2�I	<�-���>�!�4ȵ�ѴqF���ޜ��仐�a��{�P2#cP��1WȾ��j��.T�& "M*�lZ�[ӭz	"�[7�gw;cQg]<�֌(n>8
��*�>���!칚�"#��`JU�n	�⼫�T � ec�u�i�2rOՃ���3ʖrG�(�$��%���<���<1�i�2�v���T�9�.�<�E�VD�'���z4����j>M���6�>@= ��3��D9R�k��=�hh��.�����op��(�
c�g#�5�j<��r�ꞈ��A	���T���%��p0��y[�<�)�=C�=�������ab�F��S�z'D�5�~��*��>A��( vY��	�wb2�Ir�dTBh�
r��Q�_�kGi��;�}� �3��%�Xd��a����̗��t:/��e����'��� ��͆�O�����p�i&]!+01�ƕmTu���ۓu41F�Q�n_Y<���d��>��/�Ȋ%��
�թOO���n���u�E<�Ď�NǺ�y�9�&S:)S 1�h��X�Qm�&�G�GUW8�����Q�F���c�S�F8���u��;U�HP�5-딀[|��6���B�p/�`��칕g|܎�J���'
T���{ID.p3l�G���;�-r�.˗�#��Q�l�%��S��e��;�w��� A����CT��et��@r��6�$j<�G��`<Z%���>����x��Q�+���N�iN�e��B����g�3�7�\6��0�R��9h�6l<�>���#cG	�P�P�h�¡{��6�KD�9�pv���`�����A8{*bFym�WndŅs��D�����D�y�hI�(�S�yѲ��5_�`�K�	M��<7��Q!#�У����|��]O��0K��D�Mo>k�6w��o߭=l�R���i.�3���5���R�X����Et��v@eHP�{}T��-y�;#���֜0 }ֲAZ�"ӄ���V5ռ�������_�MS�Z�R�z[j��j�D�~������-Z:\�G�n�$������pLN�s��#�Xjx�{d,@��L�*-��0��<R�S�a�V�H��t�T���֡���%O�V�L�:z�+����ԣ�a��#�㺴�aC�JԛT�Rc���ml���+�QԎn�B�@�����<|dٲ�PyQpg��`r=� V1>�4�x�:�0�ѩ-+�$Ҳ�)׆�s�~��v�v�F��K]¿u���s+��CW�~-�=��9���(�%W|2ڝt[P���T�������}�ȡ�#�XY5�<�'v�>���RDY?�:�Z
�]; �x)5�s<����v �,Hk��P��A���?*����z9�F������qs���X	�����a��dԨ7���X?�kSi��8}�㤴����ua�jo-'Z��Dw8-�}dN]nQh
�<h��NaX��n$|m3��Ļ-��fd���'?�z�?�W,b�3�٘����bƁ�g�T��>*��귔�z07�{NQH�Y~x@ �̣!UU�tu��/��;�4���Bv�$Ae����6�)� %�E��ц:��Q����5h�k�#�����"4�'�q�ڝ�d@��F�hpU5��!kDsO*�3*�k�G�tc}w0���2�蘍�����8w~���N{2��:�e��sr�P�^��'�F�� �o<K&�5��/t� m��j� nD�~O�G�\	����2k�Bߵ{�,2��XƩB
� b��bը1G@�;���Pr�
aHO�@+(zev�'Im���[���[�D�/	��g$3��Ht�����t1��s/�#�-�5මĶ����O7|SjYl�7�%'��P�D�4�u�~��kqc���1�6`8�W�(��e��( �A�kގA�������Ų�{�V;���%%�Ԯ�U3g�Ⱦ�ڵ�K��z9Z-���t5�t�xjI[��Ϩ�[�2�q0�u���be�p��E�)4A񖇋�& �� �չ��x���Cj�2��Aҩ�2�]�u�n<e�sCH�ΰ76d�|'��D���Ȋ�So����� ���d0Eȏf׃�d<�&�eӦ��z���S��:0��2��N��i��j0��#��Q��3x������_����@�H���=��^Ƚ5�?$i�q3�����8
�3�s��X��i���ARm���/�:�µ/jX���a�V¬��U|Z��d���s����ir�$�O�&:��y(�i��ߺ���4p1f�	j���'Ыu8��I1�&F���Ό��M/7	`�d�@wH؃��l=�zo-������*t��a�����oK�f���b�����e25����'�ۼ��=�o���}����1���+&��!����B���ڕ�#����W�է|2z���Gx[8b<��&sr�d�L��#6�{X�=8�7�y�����������S��g\�I��qw��dE簧�)L\�/��ۻ����wJ��$���Nl?݃�����QE�o���-�U~0|Zeݫg�徳�Zf���o&0ܥ ������	2�R�}Y:��jZ~�ζ��n:�_���x<!>:�AouJI����(G_~�g:��Ӈc/��~�+�0?5�{��������4d ��[���XoT�uZ!��X]����Fm˚���d(F����ߌ��h���106�й�aA���oj)��PI��Y����%��H8o�5�r�ΩRT��:��� ����X$�R��q	�[��F�߭4�5Qu�K�L���y^�=~35/����������ɋ/��#�G     