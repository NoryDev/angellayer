ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Investors" do
          ul do
            InvestorProfile.last(10).map do |investor|
              li link_to(investor.company_name, investors_profile_path(investor))
            end
          end
        end
      end


      column do
        panel "Recent Reviews" do
          ul do
            Evaluation.last(10).map do |evaluation|
              li link_to(evaluation.title_review, evaluation_path(evaluation))
            end
          end
        end
      end

      column do
        panel "Recent Founders" do
          ul do
            Founder.last(10).map do |founder|
              li link_to(founder.name, founders_profile_path(founder))
            end
          end
        end
      end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
     end
  end # content
end
