
--###########################LOOKUP TABLES DATA INSERT QUERIES##############################

INSERT INTO account_workflow.analysis_status(	id, name, isactive, created_at, description)VALUES (1, 'analysis_pending', true, Now(), 'To initiate analysis');
INSERT INTO account_workflow.analysis_status(	id, name, isactive, created_at, description)VALUES (2, 'analysis_in_progress',true,Now(),'Analysis started and fetching reqruied data');
INSERT INTO account_workflow.analysis_status(	id, name, isactive, created_at, description)VALUES (3, 'analysis_complete',true,Now(),'Improvemnts analysis done');
INSERT INTO account_workflow.analysis_status(	id, name, isactive, created_at, description)VALUES (4, 'analysis_validation_failed',true,Now(),'analysis_validation_failed. May be data issue');
INSERT INTO account_workflow.analysis_status(	id, name, isactive, created_at, description)VALUES (5, 'analysis_failed',true,Now(),'analysis_failed. Pls see reason for more details');
INSERT INTO account_workflow.analysis_status(	id, name, isactive, created_at, description)VALUES (6, 'analysis_blocked',true,Now(),'Unable to progress analysis as data is incomplete');
INSERT INTO account_workflow.analysis_status(	id, name, isactive, created_at, description)VALUES (7, 'analysis_retriggered',true,Now(),'analysis retriggered as data is available or client initiated');
INSERT INTO account_workflow.analysis_status(	id, name, isactive, created_at, description)VALUES (8, 'optimization_pending',true,Now(),'Analysis completed and to initiate optimization');
INSERT INTO account_workflow.analysis_status(	id, name, isactive, created_at, description)VALUES (9, 'optimization_in_progress',true,Now(),'Optimization started and fetching reqruied data');
INSERT INTO account_workflow.analysis_status(	id, name, isactive, created_at, description)VALUES (10, 'optimization_complete',true,Now(),'Optimization completed successfully');
INSERT INTO account_workflow.analysis_status(	id, name, isactive, created_at, description)VALUES (11, 'optimization_failed',true,Now(),'Optimization failed. Pls see reason for more details');
INSERT INTO account_workflow.analysis_status(	id, name, isactive, created_at, description)VALUES (12, 'optimization_blocked',true,Now(),'Unable to progress Optimization as data is incomplete');
INSERT INTO account_workflow.analysis_status(	id, name, isactive, created_at, description)VALUES (13, 'optimization_retriggered',true,Now(),'retriggered as data is available or client initiated');

INSERT INTO account_workflow.analysis_trigger(id, name, isactive, created_at, description)VALUES (1,'holdings_new',true,Now(),'new holdings to be allocated');
INSERT INTO account_workflow.analysis_trigger(id, name, isactive, created_at, description)VALUES (2,'risk_score_changed',true,Now(),'Client updated his risk capability');
INSERT INTO account_workflow.analysis_trigger(id, name, isactive, created_at, description)VALUES (3,'holdings_refreshed',true,Now(),'Client updated his holding based on improvements based on suggestions');

INSERT INTO account_workflow.ticker_code(	id, name) VALUES (1,'VGT');
INSERT INTO account_workflow.ticker_code(	id, name) VALUES (2,'QQQ');
INSERT INTO account_workflow.ticker_code(	id, name) VALUES (3,'CMGIX');
INSERT INTO account_workflow.ticker_code(	id, name) VALUES (4,'APGCX');
INSERT INTO account_workflow.ticker_code(	id, name) VALUES (5,'UNCATEGORIZED');

INSERT INTO account_workflow.allocation_type(id, name)VALUES (1, 'STOCKS');
INSERT INTO account_workflow.allocation_type(id, name)VALUES (2, 'BONDS');
INSERT INTO account_workflow.allocation_type(id, name)VALUES (3, 'MISC');