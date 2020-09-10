--liquibase formatted sql
--changeset llteam:TLL-001.14
INSERT INTO risk.risk_questions(
	id, active, text)
	VALUES (1, 't', 'How much do you have saved for Retirement?');
INSERT INTO risk.risk_questions(
	id, active, text)
	VALUES (2, 't', 'Let’s ﬁnd the risk level you are comfortable with per year?');
		
INSERT INTO risk.tenant_risk_questions(
	id, tenant_id, sequence, risk_question_id)
	VALUES (12345, 'tenant-11-retail', 1, 1);
INSERT INTO risk.tenant_risk_questions(
	id, tenant_id, sequence, risk_question_id)
	VALUES (12346, 'tenant-11-retail', 2, 2);