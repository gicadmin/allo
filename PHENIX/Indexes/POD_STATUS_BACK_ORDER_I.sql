CREATE INDEX phenix.pod_status_back_order_i ON phenix.purchase_order_details(pod_status,pod_back_order_switch);