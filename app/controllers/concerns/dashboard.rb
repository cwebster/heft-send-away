module Dashboard
  extend ActiveSupport::Concern

  def dashboard_for_laboratory(laboratory_id:)
  	@dashboard_data = {}
    @dashboard_data["total_labs"] = RepertoireLookup.where(host_laboratory_id: laboratory_id).group(:referral_laboratory_id).count.count
    @dashboard_data["total_tests"] = Repertoire.tests_for_laboratory(laboratory_id:laboratory_id).count
    @dashboard_data["labs_out_of_date"] = repertoire_lookup(repertoires: Repertoire.information_out_of_date_since(months: 12, laboratory_ids: laboratory_id ))
    @dashboard_data["waiting_for_updated_information"] = repertoire_lookup(repertoires:Repertoire.waiting_for_updated_information(laboratory_ids: laboratory_id))
    @dashboard_data["information_updated_but_not_complete_for_laboratory"] = repertoire_lookup(repertoires:Repertoire.information_updated_but_not_complete_for_laboratory(laboratory_ids: laboratory_id))
    @dashboard_data["records_complete"] = repertoire_lookup(repertoires:Repertoire.send_away_records_complete(laboratory_id: laboratory_id))
  end

  def repertoire_lookup(repertoires:)
  	RepertoireLookup.where(repertoire_id: repertoires).group(:referral_laboratory_id).count.count
  end


end


Repertoire.tests_for_laboratory(laboratory_id:117).pluck(:id)