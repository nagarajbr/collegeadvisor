# ***************************TABLES START**************************************
# 1. code_tables
# 2. codetable_items
# ***************************TABLES END**************************************


    connection = ActiveRecord::Base.connection()

    connection.execute("TRUNCATE TABLE public.master_domain_items CASCADE")
    connection.execute("TRUNCATE TABLE public.master_domains CASCADE")
    connection.execute("SELECT setval('public.master_domains_id_seq', 1, true)")
    connection.execute("SELECT setval('public.master_domain_items_id_seq', 1, true)")

master_domain = MasterDomain.create(description:"Art",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)

items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"AH",short_description:"Art History",long_description:"Art History",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today )
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"MT",short_description:"Music Theory",long_description:"Music Theory",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"SA",short_description:"Studio Art: 2D/3D Design",long_description:"Studio Art: 2D/3D Design",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"SD",short_description:"Studio Art: Drawing",long_description:"Studio Art: Drawing",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)


master_domain = MasterDomain.create(description:"English",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"EL",short_description:"English Language and Composition",long_description:"English Language and Composition",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"EC",short_description:"English Literature and Composition",long_description:"English Literature and Composition",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)

master_domain = MasterDomain.create(description:"History and Social Science",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"CG",short_description:"Comparative Government and Politics",long_description:"Comparative Government and Politics",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"EH",short_description:"European History",long_description:"European History",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"HG",short_description:"Human Geography",long_description:"Human Geography",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"MA",short_description:"Macroeconomics",long_description:"Macroeconomics",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"MI",short_description:"Microeconomics",long_description:"Microeconomics",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"PS",short_description:"Psychology",long_description:"Psychology",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"UP",short_description:"US Government and Politics",long_description:"US Government and Politics",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"UH",short_description:"US History",long_description:"US History",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"WH",short_description:"World History",long_description:"World History",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)


master_domain = MasterDomain.create(description:"Math and Computer Science",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"CA",short_description:"Calculus AB",long_description:"Calculus AB",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"CB",short_description:"Calculus BC",long_description:"Calculus BC",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"CS",short_description:"Computer Science A",long_description:"Computer Science A",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"CP",short_description:"Computer Science Principles",long_description:"Computer Science Principles",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"ST",short_description:"Statistics",long_description:"Statistics",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)

 
master_domain = MasterDomain.create(description:"Sciences",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)

items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"BI",short_description:"Biology",long_description:"Biology",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"CH",short_description:"Chemistry",long_description:"Chemistry",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"ES",short_description:"Environmental Science",long_description:"Environmental Science",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"PE",short_description:"Physics C: Electricity and Magentism",long_description:"Physics C: Electricity and Magentism",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"PM",short_description:"Physics C: Mechanics",long_description:"Physics C: Mechanics",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"P1",short_description:"Physics 1: Algebra-Based",long_description:"Physics 1: Algebra-Based",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"P2",short_description:"Physics 2 - Algebra-Based",long_description:"Physics 2 - Algebra-Based",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)



master_domain = MasterDomain.create(description:"World Languages",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"CL",short_description:"Chinese Language and Culture",long_description:"Chinese Language and Culture",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"FL",short_description:"French Language and Culture",long_description:"French Language and Culture",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"GL",short_description:"German Language and Culture",long_description:"German Language and Culture",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"IL",short_description:"Italian Language and Culture",long_description:"Italian Language and Culture",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"JL",short_description:"Japanese Language and Culture",long_description:"Japanese Language and Culture",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"LA",short_description:"Latin",long_description:"Latin",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"SL",short_description:"Spanish Language and Culture",long_description:"Spanish Language and Culture",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)



master_domain = MasterDomain.create(description:"Capstone",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"RE",short_description:"Reserach",long_description:"Reserach",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"SE",short_description:"Seminar",long_description:"Seminar",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)

master_domain = MasterDomain.create(description:"Course Status",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"AT",short_description:"Already Taken?",long_description:"Already Taken?",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"PT",short_description:"Plan to take?",long_description:"Plan to take?",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)
items = MasterDomainItem.create(master_domain_id:master_domain.id,value:"CT",short_description:"Currently taking?",long_description:"Currently taking?",status:"TRUE",usage:"SD",created_by:1,updated_by:1,:created_at => Date.today ,:updated_at => Date.today)

