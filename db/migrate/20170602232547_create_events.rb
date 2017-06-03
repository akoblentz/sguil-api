class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :sid
      t.integer :cid
      t.string :signature
      t.integer :signature_gen
      t.integer :signature_id
      t.integer :signature_rev
      t.datetime :timestamp
      t.integer :unified_event_id
      t.integer :unified_event_ref
      t.datetime :unified_ref_time
      t.integer :priority
      t.string :event_class
      t.integer :status
      t.integer :src_ip, :limit => 10
      t.integer :dst_ip, :limit => 10
      t.integer :src_port
      t.integer :dst_port
      t.integer :icmp_type
      t.integer :icmp_code
      t.integer :ip_proto
      t.integer :ip_ver
      t.integer :ip_hlen
      t.integer :ip_tos
      t.integer :ip_len
      t.integer :ip_id
      t.integer :ip_flags
      t.integer :ip_off
      t.integer :ip_ttl
      t.integer :ip_csum
      t.datetime :last_modified
      t.integer :last_uid
      t.integer :abuse_queue
      t.integer :abuse_sent

      t.timestamps
    end
  end
end
