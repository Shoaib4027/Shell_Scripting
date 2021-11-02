rs.initiate({ _id: "rs01", members: [{_id: 0,host: "{{ p_hostname }}:27017"},{_id: 1,host: "{{ s1_hostname }}:27017"},{_id: 2,host: "{{ s2_hostname }}:27017"}]})
