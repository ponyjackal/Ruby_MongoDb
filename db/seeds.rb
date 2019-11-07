User.create! email: 'admin@roof-gravy.com', password: '12345678', first_name: 'Admin', last_name: 'User', role: :admin
User.create! email: 'sub-admin@roof-gravy.com', password: '12345678', first_name: 'SubAdmin', last_name: 'User', role: :sub_admin
User.create! email: 'field-rep@field-rep.com', password: '12345678', first_name: 'Test', last_name: 'User', role: :field_rep

Lead.create! email: 'some@mail.com', source: 0, work_type: 0, job_category: 0, trade_type: 0,
  contact: 'Some name', phone: '1231231231', user_id: User.first.id
Lead.create! email: 'some@mail.com', source: 0, work_type: 0, job_category: 0, trade_type: 0,
  contact: 'Some name', phone: '1231231231', user_id: User.first.id
Lead.create! email: 'some@mail.com', source: 0, work_type: 0, job_category: 0, trade_type: 0,
  contact: 'Some name', phone: '1231231231', user_id: User.first.id
