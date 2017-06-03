class EventsController < ApplicationController

  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all
    json_response(@events)
  end

  # POST /events
  def create
    @event = Event.create!(event_params)
    json_response(@event, :created)
  end

  # GET /events/:id
  def show
    json_response(@event)
  end

  # PUT /events/:id
  def update
    @event.update(event_params)
    head :no_content
  end

  # DELETE /events/:id
  def destroy
    @event.destroy
    head :no_content
  end

  private

  def event_params
    params.permit(:sid, :cid, :signature, 
                  :signature_gen, :signature_id, 
                  :signature_rev, :timestamp, :event_class, 
                  :unified_event_id, :unified_event_ref, 
                  :unified_ref_time, :priority, 
                  :status, :src_ip, :dst_ip, :src_port, 
                  :dst_port, :icmp_type, :icmp_code, 
                  :ip_proto, :ip_ver, :ip_hlen, :ip_tos, 
                  :ip_len, :ip_id, :ip_flags, :ip_off, 
                  :ip_ttl, :ip_csum, :last_modified, 
                  :last_uid, :abuse_queue, :abuse_sent)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
