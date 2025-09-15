/*
Contitional statements:
1. if-ELSE ELSE IF LADDER
2. CASE STATEMENTS


GENERAL IF-ELSE SYNTAX 
	 IF CONDITION:
		 ACTION	


EXP-4 NORMALIZATION
	1. Dependency A -> B
	2. Keys
		a. Super key: super set of keys (all possible combinations)
			-> R(a,b,c,d) = super keys = 2^(number of keys) - 1 (tp skip the null key)
			-> null values are allowed, superkey looks for uniqueness
		b. Candidate keys: Minimal in nature
			-> can also hold NULL
			-> one single key is PRIMARY KEY (property of Unique + NOT NULL)

	NORMAL FORM CONDITIONS:
		1. 1NF : No multivalued attribute
		2. 2NF : No partial dependency
			{ Any proper subset of the candidate key --> non prime attributes
			EG:
				R(A,B,C)
				CK = AB
				PA = A,B
				NPA = C
				but,
					AB -> C
					B -> C   (partially dependant)
		3. 3NF : if we're able to prove that A is superkey OR B is prime attribute  : that is in 3NF
		4. BCNF : if A -> B
				-> If you prove A is superkey the table is BCNF

	CLOSURE of functional dependencies:
		1. helps finding all candidate keys in a relation

	File me 3 things:
		1. Closure -> Candidate keys
		2. PA and NPA
		3. NF?

		c - all
		BC - all
		AC - all

*/

